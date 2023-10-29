import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/borrow_models.dart';
import '../../repositories/borrow_reositories/borrow_repository.dart';

part 'borrow_event.dart';

part 'borrow_state.dart';

class BorrowBloc extends Bloc<BorrowEvent, BorrowState> {
  BorrowRepository repository;

  BorrowBloc({required this.repository}) : super(BorrowInitialState()) {
    on<GetBorrowEvent>(_GetBorrowEvent);
    on<PostBorrowEvent>(_PostBorrowEvent);
  }

  _GetBorrowEvent(GetBorrowEvent event, Emitter<BorrowState> emit) async {
    emit(BorrowLoadingState());
    await Future.delayed(const Duration(seconds: 1), () async {
      try {
        final user = await repository.getBorrowClass.getBorrow(event.npm);
        emit(GetBorrowSuccessState(user));
      } catch (e) {
        emit(GetBorrowErrorState());
      }
    });
  }


  _PostBorrowEvent(PostBorrowEvent event, Emitter<BorrowState> emit) {}

}
