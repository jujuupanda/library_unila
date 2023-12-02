import 'package:flutter/material.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

class Apps extends StatelessWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp.router(
          routerConfig: AppRouter.route,
        ));
  }
}

