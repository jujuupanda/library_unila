import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/user_model.dart';
import '../../repositories/user_repository/user_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository repository;

  UserBloc({required this.repository}) : super(UserInitialState()) {
    on<GetUserEvent>(_GetUserEvent);
  }

  _GetUserEvent(GetUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    try {
      final user = await repository.getUserClass.getUser(event.token);
      emit(GetUserSuccessState(user));
    } catch (e) {
      emit(GetUserErrorState());
    }
  }

}
