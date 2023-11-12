part of 'password_bloc.dart';

abstract class PasswordState extends Equatable {
  const PasswordState();
}

class PasswordInitialState extends PasswordState {
  @override
  List<Object> get props => [];
}

class PasswordLoadingState extends PasswordState {
  @override
  List<Object> get props => [];
}

class PasswordSuccessState extends PasswordState {
  @override
  List<Object> get props => [];
}

class PasswordErrorState extends PasswordState {
  String errorMessage;

  PasswordErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
