import 'package:flutter/material.dart';

import '../../utils/constants/constant.dart';

class MenuHome extends StatefulWidget {
  VoidCallback function;
  String menuName;
  String menuImage;

  MenuHome(
      {Key? key,
      required this.menuImage,
      required this.menuName,
      required this.function})
      : super(key: key);

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
            border: Border.all(width: 1, color: colorPrimaryOpacity),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: widget.function,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  widget.menuImage,
                  fit: BoxFit.fill,
                  color: colorPrimary,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(widget.menuName ?? "", style: poppinsNormal),
      ],
    );
  }
}
