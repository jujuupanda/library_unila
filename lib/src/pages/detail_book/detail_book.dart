import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_unila/src/data/blocs/opac/author/author_bloc.dart';
import 'package:library_unila/src/pages/utils/book_information.dart';
import 'package:library_unila/src/pages/utils/header_page.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

import '../../data/blocs/opac/item_book/item_book_bloc.dart';
import '../../data/models/book_model.dart';

class DetailBookPage extends StatefulWidget {
  BookModel bookModel;

  DetailBookPage({Key? key, required this.bookModel}) : super(key: key);

  @override
  State<DetailBookPage> createState() => _DetailBookPageState();
}

class _DetailBookPageState extends State<DetailBookPage> {
  late ItemBookBloc _itemBookBloc;
  late AuthorBloc _authorBloc;
  int _sortColumnIndex = 0;
  bool _sortNoItemAsc = true;
  bool _sortNoCallAsc = true;
  bool _sortStatusAsc = true;
  bool _sortAsc = true;

  final parsingItemBook = _ParsingItemBook();
  final parsingBook = _ParsingBook();

  getItemBook() {
    _itemBookBloc = context.read<ItemBookBloc>();
    _itemBookBloc
        .add(GetItemBookEvent(widget.bookModel.eTitBib!.tBBibId!.toString()));
  }

  getAuthor() {
    _authorBloc = context.read<AuthorBloc>();
    _authorBloc
        .add(GetAuthorBook(widget.bookModel.eTitBib!.tBBibId!.toString()));
  }

  @override
  void initState() {
    getItemBook();
    getAuthor();
    super.initState();
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
                    information:
                        parsingBook.parsingTitle(widget.bookModel.titKey!)),
                BookInformation(
                    informationName: "Pustaka",
                    information: parsingBook.parsingPublish(
                        widget.bookModel.eTitBib!.eBib!.pubRaw!)),
                BookInformation(
                    informationName: "Edisi",
                    information: parsingBook.parsingEdition(
                        widget.bookModel.eTitBib!.eBib!.ediRaw!)),
                BookInformation(
                    informationName: "ISBN/ISSN",
                    information: widget.bookModel.eTitBib!.eBib!.eIdn == null
                        ? ""
                        : parsingBook.parsingSN(
                            widget.bookModel.eTitBib!.eBib!.eIdn!.idnKey!)),
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
                const SizedBox(height: 30),
                BlocBuilder<ItemBookBloc, ItemBookState>(
                  builder: (context, state) {
                    final calKey = widget.bookModel.eTitBib!.eBib!.calKey ?? "";
                    if (state is ItemBookLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is ItemBookSuccessState) {
                      if (state.listItemBook.isNotEmpty) {
                        final listItemBook = state.listItemBook;
                        final rows = listItemBook
                            .map(
                              (e) => DataRow(cells: [
                                DataCell(
                                    Text(e.itemNo != null ? e.itemNo! : "")),
                                DataCell(Text(e.copyNo != null
                                    ? parsingItemBook.parsingCopyNo(
                                        calKey, e.copyNo!.toString())
                                    : "")),
                                DataCell(Text(e.itemStat != null
                                    ? parsingItemBook
                                        .parsingItemStatus(e.itemStat!)
                                    : "")),
                                DataCell(Text(e.itemClss != null
                                    ? parsingItemBook
                                        .parsingItemClass(e.itemClss!)
                                    : "")),
                                DataCell(Text(e.locaCode != null
                                    ? parsingItemBook
                                        .parsingItemLocation(e.locaCode!)
                                    : "")),
                              ]),
                            )
                            .toList();
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              border: TableBorder.all(
                                  width: 1, color: Colors.black),
                              columns: [
                                DataColumn(
                                  label: const Text('No. Item'),
                                  onSort: (columnIndex, sortAscending) {
                                    setState(() {
                                      if (columnIndex == _sortColumnIndex) {
                                        _sortAsc =
                                            _sortNoItemAsc = sortAscending;
                                      } else {
                                        _sortColumnIndex = columnIndex;
                                        _sortAsc = _sortNoItemAsc;
                                      }
                                      state.listItemBook.sort((a, b) =>
                                          a.itemNo!.compareTo(b.itemNo!));
                                      if (!_sortAsc) {
                                        // state.listItemBook.sort((a, b) =>
                                        //     b.itemNo!.compareTo(a.itemNo!));
                                        state.listItemBook = state
                                            .listItemBook.reversed
                                            .toList();
                                      }
                                    });
                                  },
                                ),
                                DataColumn(
                                  label: const Text('No. Panggil'),
                                  onSort: (columnIndex, sortAscending) {
                                    setState(() {
                                      if (columnIndex == _sortColumnIndex) {
                                        _sortAsc =
                                            _sortNoCallAsc = sortAscending;
                                      } else {
                                        _sortColumnIndex = columnIndex;
                                        _sortAsc = _sortNoCallAsc;
                                      }
                                      state.listItemBook.sort((a, b) =>
                                          a.copyNo!.compareTo(b.copyNo!));
                                      if (!_sortAsc) {
                                        state.listItemBook = state
                                            .listItemBook.reversed
                                            .toList();
                                      }
                                    });
                                  },
                                ),
                                DataColumn(
                                  label: const Text('Status'),
                                  onSort: (columnIndex, sortAscending) {
                                    setState(() {
                                      if (columnIndex == _sortColumnIndex) {
                                        _sortAsc =
                                            _sortStatusAsc = sortAscending;
                                      } else {
                                        _sortColumnIndex = columnIndex;
                                        _sortAsc = _sortStatusAsc;
                                      }
                                      state.listItemBook.sort((a, b) =>
                                          a.itemStat!.compareTo(b.itemStat!));
                                      if (!_sortAsc) {
                                        state.listItemBook = state
                                            .listItemBook.reversed
                                            .toList();
                                      }
                                    });
                                  },
                                ),
                                const DataColumn(label: Text('Jenis')),
                                const DataColumn(label: Text('Lokasi Buku')),
                              ],
                              rows: rows),
                        );
                      }
                      return const InitialValueItemBook();
                    }
                    return const InitialValueItemBook();
                  },
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

class InitialValueItemBook extends StatelessWidget {
  const InitialValueItemBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
        rows: const [
          DataRow(
            cells: [
              DataCell(Text("")),
              DataCell(Text("")),
              DataCell(Text("")),
              DataCell(Text("")),
              DataCell(Text("")),
            ],
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

  parsingPublish(String publish) {
    return publish == "" || publish == "-" ? "" : publish;
  }

  parsingEdition(String edition) {
    return edition == "" || edition == "-" ? "" : edition;
  }

  parsingSN(String sn) {
    return sn == "" || sn == "-" ? "" : sn;
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
}

class _ParsingItemBook {
  parsingCopyNo(String initCopyNo, String copyNo) {
    return "${initCopyNo.toUpperCase()} C$copyNo";
  }

  parsingItemClass(String itemClass) {
    switch (itemClass) {
      case ("BK"):
        return "Buku";
      case ("BKA"):
        return "Buku Ajar";
      case ("DEF"):
        return "Default";
      case ("DKT"):
        return "Diktat";
      case ("JR"):
        return "Jurnal";
      case ("LA"):
        return "Laporan Akhir";
      case ("LAM"):
        return "Lampung Corner";
      case ("MI"):
        return "Majalah Ilmiah";
      case ("MP"):
        return "Majalah Populer";
      case ("PTK"):
        return "Penelitian Tindakan Kelas";
      case ("RS"):
        return "Rekaman Suara";
      case ("RV"):
        return "Rekaman Video/Film";
      case ("SK"):
        return "Skripsi";
      case ("TA"):
        return "Tugas Akhir";
      case ("TS"):
        return "Tesis";
      case ("ref"):
        return "Reference Book";
    }
  }

  parsingItemStatus(String itemStatus) {
    switch (itemStatus) {
      case ("MIS"):
        return "Buku Hilang";
      case ("NL"):
        return "Tidak Ada Buku";
      case ("R"):
        return "Buku Diperbaiki";
      case ("RAW"):
        return "Disiangi";
      case ("TDK"):
        return "Tidak Untuk Dipinjam";
      default:
        return "Tersedia";
    }
  }

  parsingItemLocation(String itemLocation) {
    switch (itemLocation) {
      case ("BC"):
        return "BI Corner";
      case ("FEB"):
        return "Fakultas Ekonomi & Bisnis";
      case ("FG"):
        return "Fakultas Keguruan dan Ilmu Pendidikan - Geografi";
      case ("FH"):
        return "Fakultas Hukum";
      case ("FI"):
        return "Fakultas Ilmu Sosial dan Ilmu Politik";
      case ("FK"):
        return "Fakultas Kedokteran";
      case ("FKIP"):
        return "Fakultas Keguruan dan Ilmu Pendidikan";
      case ("FP"):
        return "Fakultas Pertanian";
      case ("FPA"):
        return "Fakultas Pertanian - Agribisnis";
      case ("FPAG"):
        return "Fakultas Pertanian - Agroteknologi";
      case ("FPP"):
        return "Fakultas Pertanian - D3 Perkebunan";
      case ("FPTH"):
        return "Fakultas Pertanian - THP";
      case ("FT"):
        return "Fakultas Teknik";
      case ("KOM"):
        return "FISIP - Ilmu Komunikasi";
      case ("LAM"):
        return "Lampung Corner";
      case ("MI"):
        return "Fakultas Matematika dan Ilmu Pengatahuan Alam";
      case ("PP"):
        return "Perpustakaan Pusat";
      case ("PSJ"):
        return "Pascasarjana";
      case ("PUS"):
        return "Fakultas Ilmu Sosial dan Ilmu Politik - Pusdokinfo";
      default:
        return "Perpustakaan Pusat";
    }
  }
}
