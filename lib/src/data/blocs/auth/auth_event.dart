part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class OnInitialAuthEvent extends AuthEvent {}

class OnSignInEvent extends AuthEvent {
  final String npm;
  final String password;

  const OnSignInEvent(this.npm, this.password);
}

class OnSignOutEvent extends AuthEvent {}
