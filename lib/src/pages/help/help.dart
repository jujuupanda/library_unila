import 'package:flutter/material.dart';
import 'package:library_unila/src/pages/utils/header_page.dart';
import 'package:library_unila/src/utils/constants/constant.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderAllPage(
            headerName: "Bantuan",
            function: () {
              context.pop();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                  child: Image.asset(imagePerpus),
                ),
                const Text(
                  "Jika ada pertanyaan silahkan hubungi kontak dibawah ini",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      fontFamily: "Poppins"),
                ),
                const SizedBox(height: 8,),
                Row(
                  children: const [
                    Icon(
                      Icons.phone,
                      size: 30,
                    ),
                    SizedBox(width: 12),
                    Text(
                      "(0721) 701609",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: "Poppins"),
                    ),
                  ],
                ),
                const SizedBox(height: 6,),
                Row(
                  children: const [
                    Icon(
                      Icons.mail,
                      size: 30,
                    ),
                    SizedBox(width: 12),
                    Text(
                      "library@kpa.unila.ac.id",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: "Poppins"),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
