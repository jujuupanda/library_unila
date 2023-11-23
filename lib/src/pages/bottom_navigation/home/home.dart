import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:library_unila/src/data/services/notification_api.dart';
import 'package:library_unila/src/pages/bottom_navigation/home/home_header.dart';
import 'package:library_unila/src/pages/utils/home_menu.dart';
import 'package:library_unila/src/pages/utils/status_menu_home.dart';
import 'package:library_unila/src/utils/constants/constant.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/blocs/circulation/account/account_bloc.dart';
import '../../../data/blocs/circulation/status/status_bloc.dart';
import '../../../data/blocs/user/user_bloc.dart';
import '../../../data/models/account_circulation_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String tokenUser;
  late UserBloc _userBloc;
  late StatusBloc _statusBloc;
  late AccountBloc _accountBloc;

  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("token");
    if (token != null) {
      _getUser(token);
      tokenUser = token;
      // print("home page token $token");
      return token;
    } else {
      // print("home page token not found");
    }
    return null;
  }

  _getUser(String token) {
    _userBloc = context.read<UserBloc>();
    _userBloc.add(GetUserEvent(token));
  }

  _getStatus(String npm) {
    _statusBloc = context.read<StatusBloc>();
    _statusBloc.add(GetStatusEvent(npm));
  }

  _getAccount(String npm) {
    _accountBloc = context.read<AccountBloc>();
    _accountBloc.add(GetAccountCirculationEvent(npm));
  }

  _fineAmount(List<AccountCirculationModel> listAccount) {
    late int total = 0;
    for (var element in listAccount) {
      total += element.fineAmnt!;
    }
    for (var element in listAccount) {
      total -= element.paidAmnt!;
    }
    return total;
  }

  final notificationServices = NotificationServices();

  @override
  void initState() {
    _getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is GetUserSuccessState) {
            if (state.userModel.eMail == "" ||
                state.userModel.eMail == "-" ||
                state.userModel.phone == "" ||
                state.userModel.phone == "-" ||
                state.userModel.addr == "" ||
                state.userModel.addr == "-") {
              context.goNamed(Routes.edit, extra: state.userModel);
            }
          }
        },
        child: Column(
          children: [
            const HeaderHome(),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  return await Future.delayed(const Duration(seconds: 1), () {
                    _getUser(tokenUser);
                    _getAccount(tokenUser);
                    _getStatus(tokenUser);
                  });
                },
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is GetUserSuccessState) {
                      final npm = state.userModel.id!;
                      _getStatus(npm);
                      _getAccount(npm);
                      return ListView(
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                BlocBuilder<StatusBloc, StatusState>(
                                  builder: (context, state) {
                                    if (state is GetStatusSuccessState) {
                                      return StatusMenuHome(
                                          colorPrimary: Colors.green,
                                          colorSecondary: Colors.greenAccent,
                                          nameStatusMenuHome:
                                              "Peminjaman Yang Sedang Dilakukan:",
                                          valueStatusMenuHome:
                                              "${state.listStatus.length} Buku");
                                    }
                                    return StatusMenuHome(
                                        colorPrimary: Colors.green,
                                        colorSecondary: Colors.greenAccent,
                                        nameStatusMenuHome:
                                            "Peminjaman Yang Sedang Dilakukan:",
                                        valueStatusMenuHome: "0 Buku");
                                  },
                                ),
                                const SizedBox(height: 10),
                                BlocBuilder<StatusBloc, StatusState>(
                                  builder: (context, state) {
                                    if (state is GetStatusSuccessState) {
                                      return StatusMenuHome(
                                          colorPrimary: Colors.yellow,
                                          colorSecondary: Colors.yellowAccent,
                                          nameStatusMenuHome:
                                              "Peminjaman Yang Melewati Batas Waktu:",
                                          valueStatusMenuHome:
                                              "${state.listStatus.where((element) => DateTime.now().isAfter(DateTime.parse(element.dueDate!))).length} Buku");
                                    }
                                    return StatusMenuHome(
                                        colorPrimary: Colors.yellow,
                                        colorSecondary: Colors.yellowAccent,
                                        nameStatusMenuHome:
                                            "Peminjaman Yang Melewati Batas Waktu:",
                                        valueStatusMenuHome: "0 Buku");
                                  },
                                ),
                                const SizedBox(height: 10),
                                BlocBuilder<AccountBloc, AccountState>(
                                  builder: (context, state) {
                                    if (state
                                        is AccountCirculationSuccessState) {
                                      final fineAmnt =
                                          _fineAmount(state.listAccount);

                                      return StatusMenuHome(
                                          colorPrimary: Colors.red,
                                          colorSecondary: Colors.redAccent,
                                          nameStatusMenuHome: "Denda:",
                                          valueStatusMenuHome: currencyFormatter
                                              .format(fineAmnt));
                                    }
                                    return StatusMenuHome(
                                        colorPrimary: Colors.red,
                                        colorSecondary: Colors.redAccent,
                                        nameStatusMenuHome: "Denda:",
                                        valueStatusMenuHome:
                                            currencyFormatter.format(0));
                                  },
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MenuHome(
                                        menuImage: imageBarcode,
                                        menuName: "Barcode KTM",
                                        function: () {
                                          context.pushNamed(Routes.barcodeKTM,
                                              extra: state.userModel);
                                        }),
                                    MenuHome(
                                        menuImage: imageStatus,
                                        menuName: "Status Pinjam",
                                        function: () {
                                          context.pushNamed(Routes.status,
                                              extra: npm);
                                        }),
                                    MenuHome(
                                        menuImage: imageHistory,
                                        menuName: "History Pinjam",
                                        function: () {
                                          context.pushNamed(Routes.history,
                                              extra: npm);
                                        })
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MenuHome(
                                        menuImage: imageChecklist,
                                        menuName: "Lengkapi Akun",
                                        function: () {
                                          context.pushNamed(Routes.edit,
                                              extra: state.userModel);
                                        }),
                                    MenuHome(
                                        menuImage: imageHelp,
                                        menuName: "Bantuan",
                                        function: () {
                                          context.pushNamed(Routes.help);
                                        }),
                                    const SizedBox(height: 90, width: 90),
                                    // InkWell(
                                    //   onTap: (){
                                    //     notificationServices.showNotification(title: "title", body: "body", payload: "payload");
                                    //   },
                                    //   child: Container(
                                    //     height: 90,
                                    //     width: 90,
                                    //     decoration: BoxDecoration(
                                    //       borderRadius:
                                    //           BorderRadius.circular(90),
                                    //       color: Colors.redAccent,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
