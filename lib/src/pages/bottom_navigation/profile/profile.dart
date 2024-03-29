import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_unila/src/pages/utils/profile_information.dart';
import 'package:library_unila/src/pages/utils/profile_picture.dart';
import 'package:library_unila/src/utils/constants/constant.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/blocs/auth/auth_bloc.dart';
import '../../../data/blocs/user/user_bloc.dart';
import '../../utils/separated_line.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String tokenUser;
  late AuthBloc _authBloc;
  late UserBloc _userBloc;

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    if (token != null) {
      _getUser(token);
      tokenUser = token;
      // print("profile page token $token");
      return token;
    } else {
      // print("profile page token not found");
    }
    return null;
  }

  _signOut() {
    _authBloc = context.read<AuthBloc>();
    _authBloc.add(OnSignOutEvent());
  }

  _getUser(String token) {
    _userBloc = context.read<UserBloc>();
    _userBloc.add(GetUserEvent(token));
  }

  @override
  void initState() {
    _getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignOutSuccessState) {
          context.goNamed(Routes.signIn);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: colorPrimary),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PERPUSTAKAAN",
                                style: headerHome1,
                              ),
                              Text(
                                "UNIVERSITAS LAMPUNG",
                                style: headerHome2,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: colorBlueAnotherOpacity,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: colorPrimaryOpacity,
                              borderRadius: BorderRadius.circular(30),
                              onTap: () {
                                showSnackBar(context);
                                // context.pushNamed(Routes.setting);
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(6),
                                child: Icon(
                                  Icons.settings,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(height: 5, color: colorTertiary),
                Container(height: 8, color: colorSecondary),
              ],
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  return await Future.delayed(const Duration(seconds: 1), () {
                    _getUser(tokenUser);
                  });
                },
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        if (state is UserLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state is GetUserSuccessState) {
                          return ListView(
                            children: [
                              Column(
                                children: [
                                  const Center(
                                    child: ProfilePictures(),
                                  ),
                                  const SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      children: [
                                        ProfileInformation(
                                          nameInformation: "Nama",
                                          information: state.userModel.fName ==
                                                  null
                                              ? ""
                                              : "${state.userModel.fName} ${state.userModel.lName == "-" ? "" : state.userModel.lName}",
                                        ),
                                        const SeparateLine(),
                                        ProfileInformation(
                                          nameInformation: "NPM",
                                          information:
                                              state.userModel.id == null
                                                  ? ""
                                                  : state.userModel.id!,
                                        ),
                                        const SeparateLine(),
                                        ProfileInformation(
                                          nameInformation: "Email",
                                          information:
                                              state.userModel.eMail == null
                                                  ? ""
                                                  : state.userModel.eMail!,
                                        ),
                                        const SeparateLine(),
                                        ProfileInformation(
                                          nameInformation: "No. Telepon",
                                          information:
                                              state.userModel.phone == null
                                                  ? ""
                                                  : state.userModel.phone!,
                                        ),
                                        const SeparateLine(),
                                        ProfileInformation(
                                          nameInformation: "Alamat",
                                          information:
                                              state.userModel.addr == null
                                                  ? ""
                                                  : state.userModel.addr!,
                                        ),
                                        const SeparateLine(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Update Profile",
                                                style: poppinsNormal3),
                                            InkWell(
                                              onTap: () {
                                                context.pushNamed(Routes.edit,
                                                    extra: state.userModel);
                                              },
                                              child: const Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                size: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SeparateLine(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Ganti Password",
                                                style: poppinsNormal3),
                                            InkWell(
                                              onTap: () {
                                                // showSnackBar(context);
                                                context.pushNamed(
                                                  Routes.changePassword,
                                                  extra: state.userModel,
                                                );
                                              },
                                              child: const Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                size: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SeparateLine(),
                                        const SizedBox(height: 20),
                                        Container(
                                          width: 150,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                width: 2,
                                                color: colorPrimary,
                                              )),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () {
                                                _signOut();
                                              },
                                              splashColor: colorPrimary,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: const Center(
                                                child: Text(
                                                  "Keluar",
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                      color: colorPrimary),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                        if (state is GetUserErrorState) {
                          return const Expanded(
                            child: Center(
                              child: Text(
                                "Sepertinya ada yang salah :(",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 30,
                                    fontFamily: "Poppins"),
                              ),
                            ),
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    );
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

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Fitur sedang dalam pengembangan'),
      duration: Duration(seconds: 1),
      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {
      //     // Add your action here
      //   },
      // ),
    ),
  );
}
