import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/book_model.dart';
import '../../repositories/opac_repositories/opac_repository.dart';

part 'opac_event.dart';

part 'opac_state.dart';

class OpacBloc extends Bloc<OpacEvent, OpacState> {
  OpacRepository repository;

  OpacBloc({required this.repository}) : super(OpacInitialState()) {
    on<GetOpacEvent>(_GetOpacEvent);
  }

  _GetOpacEvent(GetOpacEvent event, Emitter<OpacState> emit) async {
    emit(OpacLoadingState());
    final listBook = await repository.getOpacClass.getOpac(event.keyword);
    emit(GetOpacSuccessState(listBook));
  }
}
