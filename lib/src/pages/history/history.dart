import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:library_unila/src/pages/utils/header_page.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

import '../../data/models/history_model.dart';
import '../utils/borrow_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<HistoryModel> listHistory = [
    HistoryModel("Judul Buku 1", "2023-10-13 00:00:00.000",
        "2023-10-17 00:00:00.000", "Penulis 1", "297 ace 1"),
    HistoryModel("Judul Buku 2", "2023-10-13 00:00:00.000",
        "2023-10-15 00:00:00.000", "Penulis 1", "297 ace 2"),
    HistoryModel("Judul Buku 3", "2023-10-06 00:00:00.000",
        "2023-10-10 00:00:00.000", "Penulis 1", "297 ace 3"),
    HistoryModel("Judul Buku 4", "2023-10-08 00:00:00.000",
        "2023-10-15 00:00:00.000", "Penulis 1", "297 ace 4"),
    HistoryModel("Judul Buku 5", "2023-10-02 00:00:00.000",
        "2023-10-09 00:00:00.000", "Penulis 1", "297 ace 5"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderAllPage(
              headerName: "History Peminjaman",
              function: () {
                context.pop();
              }),
          Expanded(
            child: GroupedListView<HistoryModel, String>(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              elements: listHistory,
              groupBy: (element) => element.dateBorrow!,
              order: GroupedListOrder.DESC,
              groupSeparatorBuilder: (String groupByValue) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        "${DateFormat('dd MMMM yyyy').format(DateTime.parse(groupByValue))}",
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Divider(
                          thickness: 3,
                          height: 2,
                        ),
                      )
                    ],
                  ),
                );
              },
              itemBuilder: (context, element) {
                return Column(
                  children: [
                    BorrowCard(
                        title: element.title,
                        noCall: element.noCall,
                        author: element.author,
                        dateReturn: element.dateReturn,
                        function: () {
                          context.pushNamed(Routes.detailHistory);
                        }),
                    const SizedBox(height: 16)
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
