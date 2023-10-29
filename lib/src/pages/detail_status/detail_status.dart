import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:library_unila/src/utils/constants/constant.dart';

import '../../data/models/borrow_models.dart';
import '../utils/book_information.dart';
import '../utils/header_page.dart';

class DetailStatusPage extends StatefulWidget {
  BorrowModels status;

  DetailStatusPage({Key? key, required this.status}) : super(key: key);

  @override
  State<DetailStatusPage> createState() => _DetailStatusPageState();
}

class _DetailStatusPageState extends State<DetailStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderAllPage(
              headerName: "Detail Peminjaman",
              function: () {
                context.pop();
              }),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              children: [
                BookInformation(
                    informationName: "Judul Buku",
                    information: widget.status.title ?? ""),
                BookInformation(
                    informationName: "Nomor Item",
                    information: widget.status.noItem ?? ""),
                BookInformation(
                    informationName: "Nomor Panggil",
                    information: widget.status.noCall ?? ""),
                BookInformation(
                    informationName: "Penulis",
                    information: widget.status.author ?? ""),
                BookInformation(
                    informationName: "Edisi",
                    information: widget.status.edition ?? ""),
                BookInformation(
                    informationName: "ISBN/ISSN",
                    information: widget.status.serialNumber ?? ""),
                BookInformation(
                    informationName: "Tanggal Pinjam",
                    information: DateFormat("dd MMMM yyyy").format(
                            DateTime.parse(widget.status.dateBorrow!)) ??
                        ""),
                BookInformation(
                    informationName: "Tanggal Pengembalian Maksimal",
                    information: DateFormat("dd MMMM yyyy").format(
                            DateTime.parse(widget.status.dateBorrow!)
                                .add(const Duration(days: 7))) ??
                        ""),
                const SizedBox(height: 20),
                const Text(
                  warningBorrow,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      fontSize: 10,
                      color: Colors.red),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
