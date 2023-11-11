import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:library_unila/src/utils/constants/constant.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

import '../../data/models/user_model.dart';
import '../utils/header_page.dart';

class BarcodeKTM extends StatefulWidget {
  UserModel userModel;

  BarcodeKTM({Key? key, required this.userModel}) : super(key: key);

  @override
  State<BarcodeKTM> createState() => _BarcodeKTMState();
}

class _BarcodeKTMState extends State<BarcodeKTM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderAllPage(
            headerName: "Barcode KTM",
            function: () {
              context.pop();
            },
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 250,
                  child: Image.asset(imagePerpus),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Nama:", style: poppinsSemiBold),
                    SizedBox(
                      width: 200,
                      child: Text(widget.userModel.fName ?? "",
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: poppinsSemiBold),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("NPM:", style: poppinsSemiBold),
                    SizedBox(
                      width: 200,
                      child: Text(widget.userModel.id ?? "",
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: poppinsSemiBold),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: BarcodeWidget(
                      data: widget.userModel.id ?? "",
                      barcode: Barcode.code128(),
                      drawText: false,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(barcodeKTMHelp, style: poppinsNormal2)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
