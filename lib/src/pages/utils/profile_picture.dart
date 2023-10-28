import 'package:flutter/material.dart';

import '../../utils/constants/constant.dart';

class ProfilePictures extends StatefulWidget {
  const ProfilePictures({Key? key}) : super(key: key);

  @override
  State<ProfilePictures> createState() => _ProfilePicturesState();
}

class _ProfilePicturesState extends State<ProfilePictures> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: colorGreyDefault,
          border:
          Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(100)),
      child: const Icon(
        Icons.person_rounded,
        size: 50,
        color: Color(0xFF323232),
      ),
    );
  }
}
