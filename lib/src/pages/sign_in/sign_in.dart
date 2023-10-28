import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_unila/src/data/blocs/auth/auth_bloc.dart';
import 'package:library_unila/src/pages/sign_in/sign_in_header.dart';
import 'package:library_unila/src/utils/constants/constant.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';
import 'package:loader_overlay/loader_overlay.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formState = GlobalKey<FormState>();
  bool _obscureText = true;
  TextEditingController npmController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  signInButton() {
    context
        .read<AuthBloc>()
        .add(OnSignInEvent(npmController.text, passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccessState) {
          context.goNamed(Routes.home);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            const HeaderSignIn(),
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "LOGIN",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 40),
                    child: Center(child: Image.asset(imagePerpus)),
                  ),
                  Form(
                    key: _formState,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "NPM",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        TextFormField(
                          controller: npmController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(12),
                          ],
                          validator: (value) {
                            if (value == '') {
                              return "NPM tidak boleh kosong!";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Masukkan NPM",
                              prefixIcon: Icon(Icons.credit_card_rounded)),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Password",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        TextFormField(
                          scrollPadding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).viewInsets.bottom),
                          controller: passwordController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.done,
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value == '') {
                              return "Password tidak boleh kosong!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Masukkan Password",
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is AuthLoadingState) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (state is SignInErrorState) {
                              return Center(
                                child: Text(
                                  state.errorMessageSignIn,
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
                        const SizedBox(height: 32),
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
                                  signInButton();
                                }
                              },
                              splashColor: colorPrimary,
                              borderRadius: BorderRadius.circular(15),
                              child: const Center(
                                child: Text(
                                  "Masuk",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
