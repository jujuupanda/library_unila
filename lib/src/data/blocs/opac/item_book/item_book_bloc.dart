import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/item_book_model.dart';
import '../../../repositories/opac_repositories/opac_repository.dart';

part 'item_book_event.dart';

part 'item_book_state.dart';

class ItemBookBloc extends Bloc<ItemBookEvent, ItemBookState> {
  OpacRepository repository;

  ItemBookBloc({required this.repository}) : super(ItemBookInitialState()) {
    on<GetItemBookEvent>(_GetItemBookEvent);
  }

  _GetItemBookEvent(GetItemBookEvent event, Emitter<ItemBookState> emit) async {
    emit(ItemBookLoadingState());
    try {
      final listItemBook =
          await repository.getOpacClass.getItemBook(event.bibId);
      emit(ItemBookSuccessState(listItemBook));
    } catch (error) {
      emit(ItemBookErrorState());
    }
  }
}
