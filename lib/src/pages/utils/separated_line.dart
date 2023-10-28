import 'package:flutter/material.dart';
class SeparateLine extends StatelessWidget {
  const SeparateLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Divider(thickness: 2, height: 2,),
    );
  }
}
