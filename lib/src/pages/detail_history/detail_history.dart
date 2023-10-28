import 'package:flutter/material.dart';
import 'package:library_unila/src/pages/utils/book_information.dart';
import 'package:library_unila/src/pages/utils/header_page.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

class DetailHistoryPage extends StatefulWidget {
  const DetailHistoryPage({Key? key}) : super(key: key);

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
                BookInformation(informationName: "Judul Buku", information: ""),
                BookInformation(informationName: "Nomor Item", information: ""),
                BookInformation(informationName: "Nomor Panggil", information: ""),
                BookInformation(informationName: "Author", information: ""),
                BookInformation(informationName: "Edisi", information: ""),
                BookInformation(informationName: "ISBN/ISSN", information: ""),
                BookInformation(informationName: "Tanggal Pinjam", information: ""),
                BookInformation(informationName: "Tanggal Kembali", information: ""),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
