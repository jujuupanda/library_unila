import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:library_unila/src/data/models/user_models.dart';

import '../../repositories/user_repository/user_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository repository;

  UserBloc({required this.repository}) : super(UserInitialState()) {
    on<GetUserEvent>(_GetUserEvent);
    on<UpdateUserEvent>(_UpdateUserEvent);
  }

  _GetUserEvent(GetUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());

    await Future.delayed(const Duration(seconds: 1), () async {
      try {
        print("user bloc start success");
        final user = await repository.getUserClass.getUser(event.token);
        emit(GetUserSuccessState(user));
        print("user bloc end success");
      } catch (e) {
        print("user bloc start error");
        emit(GetUserErrorState());
        print("user bloc end success");
      }
    });
  }

  _UpdateUserEvent(UpdateUserEvent event, Emitter<UserState> emit) async {}
}
