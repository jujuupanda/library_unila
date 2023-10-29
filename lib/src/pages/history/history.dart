import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:library_unila/src/data/blocs/history/history_bloc.dart';
import 'package:library_unila/src/pages/utils/header_page.dart';
import 'package:library_unila/src/utils/constants/constant.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/blocs/borrow/borrow_bloc.dart';
import '../../data/models/borrow_models.dart';
import '../utils/borrow_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late HistoryBloc historyBloc;
  late String tokenUser;

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    if (token != null && token != "") {
      return tokenUser = token;
    } else {
      print("history page token not found");
    }
    return null;
  }

  _getHistory(String token) {
    historyBloc = context.read<HistoryBloc>();
    historyBloc.add(GetHistoryEvent(token));
  }

  @override
  void didChangeDependencies() {
    _getToken().then((value) {
      if (value != null) {
        _getHistory(value);
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
                    child: GroupedListView<BorrowModels, String>(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      elements: state.listHistory,
                      groupBy: (element) => element.dateBorrow!,
                      order: GroupedListOrder.DESC,
                      groupSeparatorBuilder: (String groupByValue) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              Text(
                                DateFormat('dd MMMM yyyy')
                                    .format(DateTime.parse(groupByValue)),
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
                    child: Center(
                      child: Text(
                        "Anda tidak memiliki riwayat peminjaman buku",
                        style: poppinsBig,
                        textAlign: TextAlign.center,
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
