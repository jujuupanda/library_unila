part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();
  @override
  List<Object> get props => [];
}

class GetAccountCirculationEvent extends AccountEvent {
  final String npm;

  const GetAccountCirculationEvent(this.npm);
}