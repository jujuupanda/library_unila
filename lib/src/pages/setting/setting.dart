import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/header_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _BarcodeKTMState();
}

class _BarcodeKTMState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderAllPage(headerName: "Pengaturan", function: () {
            context.pop();
          }),
        ],
      ),
    );
  }
}
