import 'package:flutter/material.dart';

import '../../utils/constants/constant.dart';

class ProfileInformation extends StatefulWidget {
  String? nameInformation;
  String? information;
  ProfileInformation({Key? key, this.nameInformation, this.information}) : super(key: key);

  @override
  State<ProfileInformation> createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.nameInformation!, style: poppinsNormal3),
        SizedBox(
          width: 200,
          child: Text(widget.information!,
              textAlign: TextAlign.end,
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: poppinsNormal3),
        )
      ],
    );
  }
}
