import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:library_unila/src/pages/utils/header_page.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

import '../../utils/constants/constant.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController npmController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama", style: poppinsNormal3),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text("NPM", style: poppinsNormal3),
                    TextFormField(
                      controller: npmController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.credit_card_outlined),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text("Email", style: poppinsNormal3),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.mail_rounded),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text("No. Telepon", style: poppinsNormal3),
                    TextFormField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text("Alamat", style: poppinsNormal3),
                    TextFormField(
                      controller: addressController,
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
                              // context.pushNamed(Routes.changePassword);
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
                      width: double.infinity,
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Done'),
                                  duration: Duration(seconds: 2),
                                ),
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
          )
        ],
      ),
    );
  }
}
