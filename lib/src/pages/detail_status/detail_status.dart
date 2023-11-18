import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:library_unila/src/utils/constants/constant.dart';

import '../../data/blocs/opac/author/author_bloc.dart';
import '../../data/models/history_model.dart';
import '../utils/book_information.dart';
import '../utils/header_page.dart';

class DetailStatusPage extends StatefulWidget {
  final HistoryModel status;

  const DetailStatusPage({Key? key, required this.status}) : super(key: key);

  @override
  State<DetailStatusPage> createState() => _DetailStatusPageState();
}

class _DetailStatusPageState extends State<DetailStatusPage> {
  final parsingBook = _ParsingBook();
  late AuthorBloc _authorBloc;

  getAuthor() {
    _authorBloc = context.read<AuthorBloc>();
    _authorBloc.add(GetAuthorBook(widget.status.cItem!.itemBib!.toString()));
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
                      widget.status.cItem!.eTitBib!.eTit!.titKey!),
                ),
                BookInformation(
                  informationName: "Nomor Item",
                  information: widget.status.itemNo,
                ),
                BookInformation(
                  informationName: "Nomor Panggil",
                  information:
                      "${widget.status.cItem!.eBib!.calKey!.toUpperCase()} ${widget.status.cItem!.copyNo!}",
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
                  information: widget.status.cItem!.eBib!.ediRaw ?? "",
                ),
                BookInformation(
                  informationName: "ISBN/ISSN",
                  information: widget.status.cItem!.eBib!.eIdn!.idnKey ?? "",
                ),
                BookInformation(
                  informationName: "Tanggal Pinjam",
                  information: widget.status.chkODate != null
                      ? parsingBook.convertMonth(widget.status.chkODate!)
                      : "",
                ),
                BookInformation(
                  informationName: "Batas Waktu Peminjaman",
                  information: widget.status.dueDate != null
                      ? parsingBook.convertMonth(widget.status.dueDate!)
                      : "",
                ),
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
