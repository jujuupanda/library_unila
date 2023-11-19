import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_unila/src/data/blocs/update/password/password_bloc.dart';
import 'package:library_unila/src/data/models/user_model.dart';
import 'package:library_unila/src/pages/utils/header_page.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

import '../../utils/constants/constant.dart';

class ChangePasswordPage extends StatefulWidget {
  final UserModel userModel;

  const ChangePasswordPage({Key? key, required this.userModel})
      : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formState = GlobalKey<FormState>();
  late UserModel _userModel;
  late PasswordBloc _passwordBloc;
  late TextEditingController oldPwd;
  late TextEditingController newPwd;
  late TextEditingController newPwd2;

  @override
  void initState() {
    _userModel = widget.userModel;

    oldPwd = TextEditingController();
    newPwd = TextEditingController();
    newPwd2 = TextEditingController();

    _passwordBloc = context.read<PasswordBloc>();
    _passwordBloc.add(UpdatePasswordInitialEvent());
    super.initState();
  }

  updatePassword() {
    _passwordBloc
        .add(UpdatePasswordEvent(_userModel.id!, oldPwd.text, newPwd.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordBloc, PasswordState>(
      listener: (context, state) {
        if (state is PasswordSuccessState) {
          context.goNamed(Routes.home);
        }
      },
      child: Scaffold(
        body: BlocBuilder<PasswordBloc, PasswordState>(
          builder: (context, state) {
            if (state is PasswordLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                HeaderAllPage(
                    headerName: "Ganti Password",
                    function: () {
                      context.pop();
                    }),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      child: Form(
                        key: _formState,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Password Lama", style: poppinsNormal3),
                            TextFormField(
                              controller: oldPwd,
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == '') {
                                  return 'Harap masukkan password lama Anda';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text("Password Baru", style: poppinsNormal3),
                            TextFormField(
                              controller: newPwd,
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == '') {
                                  return 'Password baru tidak boleh kosong';
                                } else if (value!.length < 8) {
                                  return 'Password tidak boleh kurang dari 8 karakter';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text("Konfirmasi Password Baru",
                                style: poppinsNormal3),
                            TextFormField(
                              controller: newPwd2,
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == '') {
                                  return 'Password baru tidak boleh kosong';
                                } else if (value != newPwd.text) {
                                  return 'Password baru tidak cocok';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                            const SizedBox(height: 20),
                            BlocBuilder<PasswordBloc, PasswordState>(
                              builder: (context, state) {
                                // if (state is AuthLoadingState) {
                                //   return const Center(
                                //       child: CircularProgressIndicator());
                                // }
                                if (state is PasswordErrorState) {
                                  return Center(
                                    child: Text(
                                      state.errorMessage,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 10,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                            const SizedBox(height: 20),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    if (_formState.currentState!.validate()) {
                                      updatePassword();
                                    }
                                  },
                                  splashColor: colorPrimary,
                                  borderRadius: BorderRadius.circular(15),
                                  child: const Center(
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
