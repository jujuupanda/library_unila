part of 'user_info_bloc.dart';

abstract class UserInfoState extends Equatable {
  const UserInfoState();
}

class UserInfoInitialState extends UserInfoState {
  @override
  List<Object> get props => [];
}

class UpdateUserInfoLoadingState extends UserInfoState {
  @override
  List<Object> get props => [];
}

class UpdateUserInfoErrorState extends UserInfoState {
  @override
  List<Object> get props => [];
}

class UpdateUserInfoSuccessState extends UserInfoState {
  @override
  List<Object> get props => [];
}
