import 'package:flutter/material.dart';
import 'package:library_unila/src/utils/constants/constant.dart';

class HeaderAllPage extends StatefulWidget {
  String headerName;
  VoidCallback function;

  HeaderAllPage({Key? key, required this.headerName, required this.function})
      : super(key: key);

  @override
  State<HeaderAllPage> createState() => _HeaderAllPageState();
}

class _HeaderAllPageState extends State<HeaderAllPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          color: colorPrimary,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                IconButton(
                  onPressed: widget.function,
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  widget.headerName,
                  style: headerPage,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
        Container(height: 5, color: colorTertiary),
        Container(height: 8, color: colorSecondary),
      ],
    );
  }
}
