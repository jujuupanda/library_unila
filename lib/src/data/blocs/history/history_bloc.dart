import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/borrow_models.dart';
import '../../repositories/history_repositories/history_repository.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryRepository repository;

  HistoryBloc({required this.repository}) : super(HistoryInitialState()) {
    on<GetHistoryEvent>(_GetHistoryEvent);
    on<PostHistoryEvent>(_PostHistoryEvent);
  }

  _GetHistoryEvent(GetHistoryEvent event, Emitter<HistoryState> emit) async {
    emit(HistoryLoadingState());
    await Future.delayed(const Duration(seconds: 1), () async {
      try {
        final user = await repository.getHistoryClass.getHistory(event.npm);
        emit(GetHistorySuccessState(user));
      } catch (e) {
        emit(GetHistoryErrorState());
      }
    });
  }

  _PostHistoryEvent(PostHistoryEvent event, Emitter<HistoryState> emit) {}
}
