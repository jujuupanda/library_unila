import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:library_unila/src/pages/utils/book_information.dart';
import 'package:library_unila/src/pages/utils/header_page.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

import '../../data/blocs/opac/author/author_bloc.dart';
import '../../data/models/history_model.dart';

class DetailHistoryPage extends StatefulWidget {
  final HistoryModel history;

  const DetailHistoryPage({Key? key, required this.history}) : super(key: key);

  @override
  State<DetailHistoryPage> createState() => _DetailHistoryPageState();
}

class _DetailHistoryPageState extends State<DetailHistoryPage> {
  final parsingBook = _ParsingBook();
  late AuthorBloc _authorBloc;

  getAuthor() {
    _authorBloc = context.read<AuthorBloc>();
    _authorBloc.add(GetAuthorBook(widget.history.cItem!.itemBib!.toString()));
  }

  @override
  void initState() {
    getAuthor();
    super.initState();
  }

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
                  information: parsingBook.parsingTitle(
                      widget.history.cItem!.eTitBib!.eTit!.titKey!),
                ),
                BookInformation(
                  informationName: "Nomor Item",
                  information: widget.history.itemNo,
                ),
                BookInformation(
                  informationName: "Nomor Panggil",
                  information:
                      "${widget.history.cItem!.eBib!.calKey!.toUpperCase()} ${widget.history.cItem!.copyNo!}",
                ),
                BlocBuilder<AuthorBloc, AuthorState>(
                  builder: (context, state) {
                    if (state is AuthorSuccessState) {
                      final listAuthor =
                          state.listAuthor.map((e) => e.eAut!.autKey!);
                      return BookInformation(
                          informationName: "Author",
                          information: listAuthor.isNotEmpty
                              ? parsingBook.parsingAuthor("$listAuthor")
                              : "");
                    }
                    return BookInformation(
                        informationName: "Author",
                        information: parsingBook.parsingAuthor(""));
                  },
                ),
                BookInformation(
                  informationName: "Edisi",
                  information: widget.history.cItem!.eBib!.ediRaw ?? "",
                ),
                BookInformation(
                  informationName: "ISBN/ISSN",
                  information: widget.history.cItem!.eBib!.eIdn!.idnKey ?? "",
                ),
                BookInformation(
                  informationName: "Tanggal Pinjam",
                  information: widget.history.chkODate != null
                      ? parsingBook.convertMonth(widget.history.chkODate!)
                      : "",
                ),
                BookInformation(
                  informationName: "Tanggal Kembali",
                  information: widget.history.chkIDate != null
                      ? parsingBook.convertMonth(widget.history.chkIDate!)
                      : "",
                ),
                BookInformation(
                  informationName: "Batas Waktu Peminjaman",
                  information: widget.history.dueDate != null
                      ? parsingBook.convertMonth(widget.history.dueDate!)
                      : "",
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

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class _ParsingBook {
  parsingTitle(String title) {
    return title == "" || title == "-" ? "" : title.toTitleCase();
  }

  parsingAuthor(String author) {
    if (author == "" || author == "-") {
      return "";
    } else {
      String authorParsed = author.replaceAll(RegExp("[^a-zA-Z,. ]+"), "");
      String parsed = authorParsed.toTitleCase();

      return parsed;
    }
  }

  String convertMonth(String input) {
    final parsedEnglish =
        DateFormat('dd MMMM yyyy').format(DateTime.parse(input));
    return parsedEnglish.replaceAllMapped(
      RegExp(
          r'\b(January|February|March|April|May|June|July|August|September|October|November|December)\b'),
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
