import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_unila/src/data/repositories/circulation_repositories/circulation_repository.dart';

import '../../../models/history_model.dart';


part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  CirculationRepository repository;

  HistoryBloc({required this.repository}) : super(HistoryInitialState()) {
    on<GetHistoryEvent>(_getHistoryEvent);
  }

  _getHistoryEvent(GetHistoryEvent event, Emitter<HistoryState> emit) async {
    emit(HistoryLoadingState());
    try {
      final listHistory = await repository.getCirculationClass.getHistory(event.npm);
      emit(GetHistorySuccessState(listHistory));
    } catch (e) {
      emit(GetHistoryErrorState());
    }
  }

}
