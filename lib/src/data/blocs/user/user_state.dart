part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitialState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class GetUserErrorState extends UserState {
  @override
  List<Object> get props => [];
}

class GetUserSuccessState extends UserState {
  List<UserModels> userModels;

  GetUserSuccessState(this.userModels);

  @override
  List<Object> get props => [];
}

class UpdateUserErrorState extends UserState {
  @override
  List<Object> get props => [];
}

class UpdateUserSuccessState extends UserState {
  @override
  List<Object> get props => [];
}
