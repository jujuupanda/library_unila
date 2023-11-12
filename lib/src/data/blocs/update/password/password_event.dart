part of 'password_bloc.dart';

abstract class PasswordEvent extends Equatable {
  const PasswordEvent();

  @override
  List<Object?> get props => [];
}

class UpdatePasswordEvent extends PasswordEvent {
  String npm;
  String oldPwd;
  String newPwd;

  UpdatePasswordEvent(this.npm, this.oldPwd, this.newPwd);
}

class UpdatePasswordInitialEvent extends PasswordEvent {}