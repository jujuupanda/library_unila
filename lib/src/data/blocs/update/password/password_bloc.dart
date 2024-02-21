import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repositories/user_repository/user_repository.dart';

part 'password_event.dart';

part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  UserRepository repository;

  PasswordBloc({required this.repository}) : super(PasswordInitialState()) {
    on<UpdatePasswordEvent>(_UpdatePasswordEvent);
    on<UpdatePasswordInitialEvent>(_UpdatePasswordInitialEvent);
  }

  _UpdatePasswordInitialEvent(
      UpdatePasswordInitialEvent event, Emitter<PasswordState> emit) {
    emit(PasswordInitialState());
  }

  _UpdatePasswordEvent(
      UpdatePasswordEvent event, Emitter<PasswordState> emit) async {
    emit(PasswordLoadingState());
    try {
      await repository.updateUserClass
          .updatePassword(event.npm, event.oldPwd, event.newPwd);
      if (repository.updateUserClass.errorMessageChangePassword == "") {
        emit(PasswordSuccessState());
      } else {
        emit(PasswordErrorState(
            repository.updateUserClass.errorMessageChangePassword));
      }
    } catch (error) {
      emit(PasswordErrorState("Password Salah!"));
    }
  }
}
