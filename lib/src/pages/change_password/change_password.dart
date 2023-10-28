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
  @override
  Widget build(BuildContext context) {
    GlobalKey _formState = GlobalKey<FormState>();
    TextEditingController oldPassword = TextEditingController();
    TextEditingController newPassword = TextEditingController();
    TextEditingController newPassword2 = TextEditingController();
    return Scaffold(
      body: Column(children: [
        HeaderAllPage(headerName: "Ganti Password", function: (){
          context.pop();
        }),
        Form(
          key: _formState,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Password Lama", style: poppinsNormal3),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: oldPassword,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Konfirmasi Password Lama",
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("Password Baru", style: poppinsNormal3),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: newPassword,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Masukkan Password Baru",
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("Konfirmasi Password Baru", style: poppinsNormal3),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: newPassword2,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == '') {
                        return "Password tidak boleh kosong";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Konfirmasi Password Baru",
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_formState.currentState!.validate()) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text('Done'),
                        //       duration: Duration(seconds: 2),
                        //     ),
                        //   );
                        // }
                      },
                      child: const Text("Submit"),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom)),
                ],
              ),
            ),
          ),
        ),
      ],),
    );
  }
}
