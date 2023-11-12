part of 'user_info_bloc.dart';

abstract class UserInfoEvent extends Equatable {
  const UserInfoEvent();


  @override
  List<Object?> get props => [];
}

class UpdateUserInfoEvent extends UserInfoEvent {
  String npm;
  String email;
  String phone;
  String address;

  UpdateUserInfoEvent( this.npm, this.email, this.phone, this.address);
}
