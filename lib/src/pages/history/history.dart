import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:library_unila/src/pages/utils/header_page.dart';
import 'package:library_unila/src/utils/constants/constant.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

import '../../data/blocs/circulation/history/history_bloc.dart';
import '../../data/models/history_model.dart';
import '../../data/models/user_model.dart';
import '../utils/borrow_card.dart';

class HistoryPage extends StatefulWidget {
  final String npm;
  const HistoryPage({Key? key, required this.npm}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late HistoryBloc historyBloc;

  _getHistory(String npm) {
    historyBloc = context.read<HistoryBloc>();
    historyBloc.add(GetHistoryEvent(npm));
  }

  @override
  void initState() {
    _getHistory(widget.npm);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final parsingBook = _ParsingBook();
    
    return Scaffold(
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is GetHistorySuccessState) {
            return Column(
              children: [
                HeaderAllPage(
                    headerName: "History Peminjaman",
                    function: () {
                      context.pop();
                    }),
                if (state.listHistory.isNotEmpty)
                  Expanded(
                    child: GroupedListView<HistoryModel, String>(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      elements: state.listHistory,
                      groupBy: (element) => element.chkODate!,
                      order: GroupedListOrder.DESC,
                      groupSeparatorBuilder: (String groupByValue) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              Text(parsingBook.convertMonth(groupByValue),
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
                                title: element.cItem!.eTitBib!.eTit!.titKey!,
                                noCall: "${element.cItem!.eBib!.calKey!} ${element.cItem!.copyNo.toString()}",
                                borrowDate: element.chkODate != null ? element.chkODate.toString() : "",
                                dueDate: element.dueDate != null ? element.dueDate.toString() : "",
                                returnDate: element.chkIDate != null ? element.chkIDate.toString() : "",
                                function: () {
                                  context.pushNamed(Routes.detailHistory,
                                      extra: element);
                                }),
                            const SizedBox(height: 16)
                          ],
                        );
                      },
                    ),
                  )
                else
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          "Anda tidak memiliki riwayat peminjaman buku",
                          style: poppinsBig,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class _ParsingBook {
  parsingTitle(String title) {
    return title == "" || title == "-" ? "" : title.toTitleCase();
  }
  String convertMonth(String input) {
    final parsedEnglish = DateFormat('dd MMMM yyyy').format(DateTime.parse(input));
    return parsedEnglish.replaceAllMapped(
      RegExp(r'\b(January|February|March|April|May|June|July|August|September|October|November|December)\b'),
          (Match match) {
        switch (match.group(0)) {
          case 'January':
            return 'Januari';
          case 'February':
            return 'Februari';
          case 'March':
            return 'Maret';
          case 'April':
            return 'April';
          case 'May':
            return 'Mei';
          case 'June':
            return 'Juni';
          case 'July':
            return 'Juli';
          case 'August':
            return 'Agustus';
          case 'September':
            return 'September';
          case 'October':
            return 'Oktober';
          case 'November':
            return 'November';
          case 'December':
            return 'Desember';
          default:
            return match.group(0)!;
        }
      },
    );
  }

}
