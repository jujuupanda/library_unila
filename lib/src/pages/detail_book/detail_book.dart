import 'package:flutter/material.dart';
import 'package:library_unila/src/data/models/detailed_book_model.dart';
import 'package:library_unila/src/pages/utils/book_information.dart';
import 'package:library_unila/src/pages/utils/header_page.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

import '../../data/models/book_models.dart';

class DetailBookPage extends StatefulWidget {
  BookModels bookModels;

  DetailBookPage({Key? key, required this.bookModels}) : super(key: key);

  @override
  State<DetailBookPage> createState() => _DetailBookPageState();
}

class _DetailBookPageState extends State<DetailBookPage> {
  List<DetailedBookModel> listBookInformation = [
    DetailedBookModel("3622101101001", "392 gce kc 1", "Sedang Diperbaiki",
        "Buku", "Perpustakaan"),
    DetailedBookModel(
        "3622101101002", "392 gce kc 2", "Tersedia", "Buku", "Perpustakaan"),
    DetailedBookModel("3622101101003", "392 gce kc 3", "Tidak Untuk Dipinjam",
        "Buku", "Perpustakaan"),
    DetailedBookModel(
        "3622101101004", "392 gce kc 4", "Tersedia", "Buku", "Perpustakaan"),
  ];

  listDataRow() {
    listBookInformation.map((e) {
      return [
        DataCell(Text(e.noItem!)),
        DataCell(Text(e.noCall!)),
        DataCell(Text(e.status!)),
        DataCell(Text(e.type!)),
        DataCell(Text(e.location!))
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderAllPage(
              headerName: "Detail Buku",
              function: () {
                context.pop();
              }),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              children: [
                BookInformation(
                    informationName: "Judul Buku",
                    information: widget.bookModels.title ?? ""),
                BookInformation(
                    informationName: "Pustaka",
                    information: widget.bookModels.pusLib ?? ""),
                BookInformation(
                    informationName: "Edisi",
                    information: widget.bookModels.edition ?? ""),
                BookInformation(
                    informationName: "ISBN/ISSN",
                    information: widget.bookModels.serialNumber ?? ""),
                BookInformation(
                    informationName: "Author",
                    information: widget.bookModels.author ?? ""),
                const SizedBox(height: 30),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    border: TableBorder.all(width: 1, color: Colors.black),
                    columns: [
                      DataColumn(
                        label: const Text('No. Item'),
                        onSort: (columnIndex, ascending) {},
                      ),
                      const DataColumn(label: Text('No. Panggil')),
                      const DataColumn(label: Text('Status')),
                      const DataColumn(label: Text('Jenis')),
                      const DataColumn(label: Text('Lokasi Buku')),
                    ],
                    rows: widget.bookModels.data!
                        .map((e) => DataRow(cells: [
                              DataCell(Text(e.noItem ?? "")),
                              DataCell(Text(e.noCall ?? "")),
                              DataCell(Text(e.status ?? "")),
                              DataCell(Text(e.type ?? "")),
                              DataCell(Text(e.location ?? "")),
                            ]))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
