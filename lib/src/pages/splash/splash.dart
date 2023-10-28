import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:library_unila/src/utils/constants/constant.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/blocs/auth/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int prefIntro = 0;
  late Timer _timer;
  late AuthBloc _authBloc;

  splashscreenStart() {
    _timer = Timer(const Duration(seconds: 2, milliseconds: 5), () async {
      // if (prefIntro == 1) {
      //   context.goNamed(Routes.signIn);
      // } else {
      //   context.goNamed(Routes.onBoarding);
      // }
      // context.goNamed(Routes.signIn);
    });
  }

  initialAuth() {
    _authBloc = context.read<AuthBloc>();
    _authBloc.add(OnInitialAuthEvent());
  }

  Future introPreference() async {
    final pref = await SharedPreferences.getInstance();
    int? intro = pref.getInt('prefIntro');
    if (intro != null && intro == 1) {
      return prefIntro = 1;
    }
    pref.setInt('prefIntro', 1);
  }

  @override
  void didChangeDependencies() {
    // introPreference();
    initialAuth();
    splashscreenStart();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          context.goNamed(Routes.signIn);
        }
        if (state is IsAuthenticated) {
          context.goNamed(Routes.home);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: colorPrimary,
            ),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.width * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.8)),
              ),
            ),
            Center(
              child: Container(
                width: 250,
                height: 100,
                child: Image.asset(imagePerpus),
              ),
            )
          ],
        ),
      ),
    );
  }
}
