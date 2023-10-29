import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:library_unila/src/pages/bottom_navigation/home/home_header.dart';
import 'package:library_unila/src/pages/utils/home_menu.dart';
import 'package:library_unila/src/pages/utils/status_menu_home.dart';
import 'package:library_unila/src/utils/constants/constant.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/blocs/user/user_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 2,
  );

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    if (token != null && token != "") {
      context.read<UserBloc>().add(GetUserEvent(token));
      return token;
    } else {
      print("home page token not found");
    }
    return null;
  }

  @override
  void didChangeDependencies() {
    _getToken();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          print(state);
          if (state is UserLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetUserSuccessState) {
            return Column(
              children: [
                const HeaderHome(),
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        StatusMenuHome(
                            colorPrimary: Colors.green,
                            colorSecondary: Colors.greenAccent,
                            nameStatusMenuHome: "Peminjaman Yang Sedang Dilakukan:",
                            valueStatusMenuHome: "1 Buku"),
                        const SizedBox(height: 10),
                        StatusMenuHome(
                            colorPrimary: Colors.yellow,
                            colorSecondary: Colors.yellowAccent,
                            nameStatusMenuHome: "Peminjaman Yang Melewati Batas Waktu:",
                            valueStatusMenuHome: "1 Buku"),
                        const SizedBox(height: 10),
                        StatusMenuHome(
                            colorPrimary: Colors.red,
                            colorSecondary: Colors.redAccent,
                            nameStatusMenuHome: "Denda:",
                            valueStatusMenuHome: "${currencyFormatter.format(state.userModels.first.fined) ?? 0}"),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuHome(
                                menuImage: imageBarcode,
                                menuName: "Barcode KTM",
                                function: () {
                                  context.pushNamed(Routes.barcodeKTM);
                                }),
                            MenuHome(
                                menuImage: imageStatus,
                                menuName: "Status Pinjam",
                                function: () {
                                  context.pushNamed(Routes.status);
                                }),
                            MenuHome(
                                menuImage: imageHistory,
                                menuName: "History Pinjam",
                                function: () {
                                  context.pushNamed(Routes.history);
                                })
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuHome(
                                menuImage: imageChecklist,
                                menuName: "Lengkapi Akun",
                                function: () {
                                  context.pushNamed(Routes.edit,
                                      extra: state.userModels);
                                }),
                            MenuHome(
                                menuImage: imageHelp,
                                menuName: "Bantuan",
                                function: () {
                                  context.pushNamed(Routes.help);
                                }),
                            const SizedBox(height: 90, width: 90),
                          ],
                        ),
                      ],
                    )),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
