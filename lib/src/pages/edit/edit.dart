import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_unila/src/data/blocs/update/user_information/user_info_bloc.dart';
import 'package:remove_emoji_input_formatter/remove_emoji_input_formatter.dart';

import '../../data/models/user_model.dart';
import '../../utils/constants/constant.dart';
import '../../utils/routes/app_router.dart';
import '../utils/header_page.dart';

class EditProfilePage extends StatefulWidget {
  final UserModel userModel;

  const EditProfilePage({Key? key, required this.userModel}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formState = GlobalKey<FormState>();
  late UserInfoBloc _userBloc;
  late UserModel userModel;

  late TextEditingController nameController;
  late TextEditingController npmController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;

  patchUser() {
    _userBloc = context.read<UserInfoBloc>();
    _userBloc.add(UpdateUserInfoEvent(userModel.id!, emailController.text,
        phoneController.text, addressController.text));
  }

  @override
  void initState() {
    userModel = widget.userModel;
    nameController = TextEditingController(
        text:
            "${userModel.fName} ${userModel.lName == "-" ? "" : userModel.lName}");
    npmController = TextEditingController(text: userModel.id);
    emailController = TextEditingController(text: userModel.eMail);
    phoneController = TextEditingController(text: userModel.phone);
    addressController = TextEditingController(text: userModel.addr);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserInfoBloc, UserInfoState>(
      listener: (context, state) {
        if (state is UpdateUserInfoSuccessState) {
          context.goNamed(Routes.home);
        }
      },
      child: Scaffold(
        body: BlocBuilder<UserInfoBloc, UserInfoState>(
          builder: (context, state) {
            if (state is UpdateUserInfoLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                HeaderAllPage(
                    headerName: "Edit Profile",
                    function: () {
                      context.pop();
                    }),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                validator: (value) => EmailValidator.validate(
                                        emailController.text)
                                    ? null
                                    : "Masukkan email yang valid",
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
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(14),
                                ],
                                validator: (value) {
                                  if (value == '') {
                                    return 'No. Telepon tidak boleh kosong';
                                  } else if (value!.length < 10) {
                                    return 'No. Telepon harap diisi dengan benar';
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
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                validator: (value) {
                                  if (value == '') {
                                    return 'Alamat tidak boleh kosong';
                                  } else if (value!.length <= 15) {
                                    return 'Alamat harap diisi dengan lengkap';
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
                                        showSnackBar(context);
                                        // context.pushNamed(Routes.changePassword,
                                        //     extra: userModel);
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
                                        patchUser();
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
                              const SizedBox(height: 20),
                              const Text(
                                cautionUpdate,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    fontSize: 10,
                                    color: Colors.red),
                              ),
                              const SizedBox(height: 60),
                            ],
                          ),
                        ),
                      ),
                    ],
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
