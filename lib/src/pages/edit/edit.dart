import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:library_unila/src/pages/utils/header_page.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';
import 'package:remove_emoji_input_formatter/remove_emoji_input_formatter.dart';

import '../../data/models/user_model.dart';
import '../../utils/constants/constant.dart';

class EditProfilePage extends StatefulWidget {
  UserModel userModel;

  EditProfilePage({Key? key, required this.userModel}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: widget.userModel.fName ?? "");
    TextEditingController npmController =
        TextEditingController(text: widget.userModel.id ?? "");
    TextEditingController emailController =
        TextEditingController(text: widget.userModel.eMail ?? "");
    TextEditingController phoneController =
        TextEditingController(text: widget.userModel.phone ?? "");
    TextEditingController addressController =
        TextEditingController(text: widget.userModel.addr ?? "");
    TextEditingController pw = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          HeaderAllPage(
              headerName: "Edit Profile",
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
                      const Text("Nama", style: poppinsNormal3),
                      TextFormField(
                        controller: nameController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text("NPM", style: poppinsNormal3),
                      TextFormField(
                        controller: npmController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.credit_card_outlined),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text("Email", style: poppinsNormal3),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            EmailValidator.validate(emailController.text)
                                ? null
                                : "Masukkan email yang valid",
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        inputFormatters: [RemoveEmojiInputFormatter()],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.mail_rounded),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text("No. Telepon", style: poppinsNormal3),
                      TextFormField(
                        controller: phoneController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(14),
                        ],
                        validator: (value) {
                          if (value == '') {
                            return 'No. Telepon tidak boleh kosong';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text("Alamat", style: poppinsNormal3),
                      TextFormField(
                        controller: addressController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == '') {
                            return 'Alamat tidak boleh kosong';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.location_on_rounded),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Material(
                            child: InkWell(
                              onTap: () {
                                context.pushNamed(Routes.changePassword);
                              },
                              child: const Text(
                                "Ganti Password",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: colorPrimary),
                              ),
                            ),
                          )),
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
