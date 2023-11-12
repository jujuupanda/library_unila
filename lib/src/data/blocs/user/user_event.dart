part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class GetUserEvent extends UserEvent {
  String token;

  GetUserEvent(this.token);
}

class UpdateUserEvent extends UserEvent {
  String token;
  String npm;
  String email;
  String phone;
  String address;

  UpdateUserEvent(this.token, this.npm, this.email, this.phone, this.address);
}
