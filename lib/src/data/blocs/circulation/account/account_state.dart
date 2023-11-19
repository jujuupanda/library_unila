part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();
}

class AccountInitialState extends AccountState {
  @override
  List<Object> get props => [];
}

class AccountCirculationLoadingState extends AccountState {
  @override
  List<Object> get props => [];
}

class AccountCirculationSuccessState extends AccountState {
  final List<AccountCirculationModel> listAccount;

  const AccountCirculationSuccessState(this.listAccount);

  @override
  List<Object> get props => [];
}

class AccountCirculationErrorState extends AccountState {
  @override
  List<Object> get props => [];
}
