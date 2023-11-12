import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repositories/user_repository/user_repository.dart';

part 'user_info_event.dart';

part 'user_info_state.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  UserRepository repository;

  UserInfoBloc({required this.repository}) : super(UserInfoInitialState()) {
    on<UpdateUserInfoEvent>(_UpdateUserInfoEvent);
  }

  _UpdateUserInfoEvent(
      UpdateUserInfoEvent event, Emitter<UserInfoState> emit) async {
    emit(UpdateUserInfoLoadingState());
    try {
      await repository.updateUserClass.updateUser(event.npm, event.address, event.phone, event.email);
      emit(UpdateUserInfoSuccessState());
    } catch (error) {
      emit(UpdateUserInfoErrorState());
    }
  }
}
