import 'package:flutter/material.dart';
import 'package:library_unila/src/pages/utils/header_page.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

import '../../utils/constants/constant.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController oldPassword = TextEditingController();
    TextEditingController newPassword = TextEditingController();
    TextEditingController newPassword2 = TextEditingController();
    return Scaffold(
      body: Column(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Form(
                  key: _formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Password Lama", style: poppinsNormal3),
                      TextFormField(
                        controller: oldPassword,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == '') {
                            return 'Harap masukkan password lama Anda';
                          } else {
                            return null;
                          }
                        },
                        decoration:  InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text("Password Baru", style: poppinsNormal3),
                      TextFormField(
                        controller: newPassword,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        controller: newPassword2,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == '') {
                            return 'Password baru tidak boleh kosong';
                          } else if (value != newPassword.text) {
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
                      const SizedBox(height: 30),
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
                                Future.delayed(const Duration(seconds: 1), () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Done'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }).then(
                                  (value) {
                                    context.pop();
                                  },
                                );
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
      ),
    );
  }
}
