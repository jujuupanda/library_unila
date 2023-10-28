import 'package:flutter/material.dart';

class BookInformation extends StatefulWidget {
  String? informationName;
  String? information;

  BookInformation(
      {Key? key, required this.informationName, required this.information})
      : super(key: key);

  @override
  State<BookInformation> createState() => _BookInformationState();
}

class _BookInformationState extends State<BookInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.informationName!,
          style: const TextStyle(
              fontFamily: "Poppins", fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          widget.information!,
          style: const TextStyle(
              fontFamily: "Poppins", fontSize: 16),
        ),
        const SizedBox(height: 2),
        const Divider(
          height: 2,
          color: Colors.black,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
