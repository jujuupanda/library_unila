import 'package:flutter/material.dart';

import '../../utils/constants/constant.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> scaffoldMessanger(
    BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(featureOnProcess),
      duration: Duration(seconds: 1),
    ),
  );
}
