import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_unila/src/data/blocs/opac/opac_bloc.dart';
import 'package:library_unila/src/pages/utils/book_card.dart';
import 'package:library_unila/src/utils/routes/app_router.dart';

import '../../data/models/book_models.dart';

class MySearch extends SearchDelegate {
  MySearch({Key? key});

  late OpacBloc opacBloc;
  late List<BookModels> listBook2;

  _getListBook(BuildContext context, String keyword) {
    opacBloc = context.read<OpacBloc>();
    opacBloc.add(GetOpacEvent(keyword));
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
    _getListBook(context, query);
    return BlocBuilder<OpacBloc, OpacState>(
      builder: (context, state) {
        if (state is OpacLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetOpacSuccessState) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            itemCount: state.listBook.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: BookCard(
                    title: state.listBook[index].title ?? "",
                    noCall: state.listBook[index].noCallBook ?? "",
                    author: state.listBook[index].author ?? "",
                    function: () {
                      context.pushNamed(Routes.detailBook,
                          extra: state.listBook[index]);
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
