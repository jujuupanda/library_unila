import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_unila/src/pages/bottom_navigation/profile/profile_header.dart';
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
  late AuthBloc _authBloc;
  late UserBloc _userBloc;

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    if (token != null) {
      _getUser(token);
      print("profile page token $token");
      return token;
    } else {
      print("profile page token not found");
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
  void didChangeDependencies() {
    _getToken();
    super.didChangeDependencies();
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
            const HeaderProfile(),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Expanded(
                      child: Center(child: CircularProgressIndicator()));
                }
                return BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserLoadingState) {
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    }
                    if (state is GetUserSuccessState) {
                      return Column(
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 40),
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
                                      information: state.userModels.first.name == null ? "" : state.userModels.first.name!,
                                    ),
                                    const SeparateLine(),
                                    ProfileInformation(
                                      nameInformation: "NPM",
                                      information: state.userModels.first.npm == null ? "" : state.userModels.first.npm!,
                                    ),
                                    const SeparateLine(),
                                    ProfileInformation(
                                      nameInformation: "Email",
                                      information: state.userModels.first.email == null ? "" : state.userModels.first.email!,
                                    ),
                                    const SeparateLine(),
                                    ProfileInformation(
                                      nameInformation: "No. Telepon",
                                      information: state.userModels.first.phone == null ? "" : state.userModels.first.phone!,
                                    ),
                                    const SeparateLine(),
                                    ProfileInformation(
                                      nameInformation: "Alamat",
                                      information: state.userModels.first.address == null ? "" : state.userModels.first.address!,
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
                                            context.pushNamed(
                                                Routes.changePassword);
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: SizedBox(
                              width: 150,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  // _getToken();
                                  _signOut();
                                  // context.goNamed(Routes.signIn);
                                },
                                child: const Text("Keluar",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 18,
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is GetUserErrorState) {
                      return Column(
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 40),
                              const Center(child: ProfilePictures()),
                              const SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    ProfileInformation(
                                      nameInformation: "Nama",
                                      information: "",
                                    ),
                                    const SeparateLine(),
                                    ProfileInformation(
                                      nameInformation: "NPM",
                                      information: "",
                                    ),
                                    const SeparateLine(),
                                    ProfileInformation(
                                      nameInformation: "Email",
                                      information: "",
                                    ),
                                    const SeparateLine(),
                                    ProfileInformation(
                                      nameInformation: "No. Telepon",
                                      information: "",
                                    ),
                                    const SeparateLine(),
                                    ProfileInformation(
                                      nameInformation: "Alamat",
                                      information: "",
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
                                            context.pushNamed(
                                                Routes.changePassword);
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: SizedBox(
                              width: 150,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  // _getToken();
                                  _signOut();
                                  // context.goNamed(Routes.signIn);
                                },
                                child: const Text("Keluar",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 18,
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
