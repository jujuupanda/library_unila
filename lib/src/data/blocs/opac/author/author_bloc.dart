import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_unila/src/data/models/author_model.dart';

import '../../../repositories/opac_repositories/opac_repository.dart';

part 'author_event.dart';

part 'author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  OpacRepository repository;

  AuthorBloc({required this.repository}) : super(AuthorInitialState()) {
    on<GetAuthorBook>(_GetAuthorBook);
  }
  _GetAuthorBook(GetAuthorBook event, Emitter emit) async {
    emit(AuthorLoadingState());
    try {
      final listAuthor =
          await repository.getOpacClass.getAuthorBook(event.bibId);
      emit(AuthorSuccessState(listAuthor));
    } catch (error) {
      emit(AuthorErrorState());
    }
  }
}
