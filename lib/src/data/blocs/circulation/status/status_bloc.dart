import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/history_model.dart';
import '../../../repositories/circulation_repositories/circulation_repository.dart';

part 'status_event.dart';
part 'status_state.dart';

class StatusBloc extends Bloc<StatusEvent, StatusState> {
  CirculationRepository repository;

  StatusBloc({required this.repository}) : super(StatusInitialState()) {
    on<GetStatusEvent>(_getStatusEvent);
  }

  _getStatusEvent(GetStatusEvent event, Emitter<StatusState> emit) async {
    emit(StatusLoadingState());
    try {
      final listHistory = await repository.getCirculationClass.getStatus(event.npm);
      emit(GetStatusSuccessState(listHistory));
    } catch (e) {
      emit(GetStatusErrorState());
    }
  }

}
