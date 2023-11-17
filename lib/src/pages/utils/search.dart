import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_unila/src/data/blocs/opac/opac_bloc.dart';
import 'package:library_unila/src/pages/utils/book_card.dart';
import 'package:library_unila/src/utils/constants/constant.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';


class MySearch extends SearchDelegate {
  MySearch({Key? key});

  late OpacBloc _opacBloc;
  final parsingBook = _ParsingBook();

  _getListBook(BuildContext context, String keyword) {
    _opacBloc = context.read<OpacBloc>();
    _opacBloc.add(GetOpacEvent(keyword));
  }


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: query != ""
            ? IconButton(
                onPressed: () {
                  query = "";
                },
                icon: const Icon(Icons.clear),
              )
            : const SizedBox(),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query == "") {
      return const SizedBox();
    }
    _getListBook(context, query);
    return BlocBuilder<OpacBloc, OpacState>(
      builder: (context, state) {
        if (state is OpacLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetOpacSuccessState) {
          final listBook = state.listBook;
          if (listBook.isEmpty) {
            return const Center(
              child: Text(
                "Buku Tidak Ditemukan",
                style: poppinsBig,
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            itemCount: listBook.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: BookCard(
                    title: parsingBook.parsingTitle(listBook[index].titKey!),
                    noCall: listBook[index].eTitBib!.eBib!.calKey?.toUpperCase() ?? "",
                    function: () {
                      context.pushNamed(Routes.detailBook,
                          extra: listBook[index]);
                    }),
              );
            },
          );
        }
        return const Center(
          child: SizedBox(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
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
    return author == "" || author == "-" ? "" : author.toTitleCase();
  }
}
