import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:library_unila/src/utils/constants/constant.dart';

import '../utils/book_information.dart';
import '../utils/header_page.dart';

class DetailStatusPage extends StatefulWidget {
  const DetailStatusPage({Key? key}) : super(key: key);

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
                BookInformation(informationName: "Judul Buku", information: ""),
                BookInformation(informationName: "Nomor Item", information: ""),
                BookInformation(
                    informationName: "Nomor Panggil", information: ""),
                BookInformation(informationName: "Author", information: ""),
                BookInformation(informationName: "Edisi", information: ""),
                BookInformation(informationName: "ISBN/ISSN", information: ""),
                BookInformation(
                    informationName: "Tanggal Pinjam", information: ""),
                BookInformation(
                    informationName: "Tanggal Pengembalian Maksimal",
                    information: ""),
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
