import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:library_unila/src/pages/utils/book_information.dart';
import 'package:library_unila/src/pages/utils/header_page.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

import '../../data/models/borrow_models.dart';

class DetailHistoryPage extends StatefulWidget {
  BorrowModels history;

  DetailHistoryPage({Key? key, required this.history}) : super(key: key);

  @override
  State<DetailHistoryPage> createState() => _DetailHistoryPageState();
}

class _DetailHistoryPageState extends State<DetailHistoryPage> {
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
                    information: widget.history.title ?? ""),
                BookInformation(
                    informationName: "Nomor Item",
                    information: widget.history.noItem ?? ""),
                BookInformation(
                    informationName: "Nomor Panggil",
                    information: widget.history.noCall ?? ""),
                BookInformation(
                    informationName: "Penulis",
                    information: widget.history.author ?? ""),
                BookInformation(
                    informationName: "Edisi",
                    information: widget.history.edition ?? ""),
                BookInformation(
                    informationName: "ISBN/ISSN",
                    information: widget.history.serialNumber ?? ""),
                BookInformation(
                    informationName: "Tanggal Pinjam",
                    information: DateFormat("dd MMMM yyyy").format(
                            DateTime.parse(widget.history.dateBorrow!)) ??
                        ""),
                BookInformation(
                    informationName: "Tanggal Kembali",
                    information: DateFormat("dd MMMM yyyy").format(
                            DateTime.parse(widget.history.dateReturn!)) ??
                        ""),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
