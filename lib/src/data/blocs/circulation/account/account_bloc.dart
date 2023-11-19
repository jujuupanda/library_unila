import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/account_circulation_model.dart';
import '../../../repositories/circulation_repositories/circulation_repository.dart';

part 'account_event.dart';

part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  CirculationRepository repository;

  AccountBloc({required this.repository}) : super(AccountInitialState()) {
    on<GetAccountCirculationEvent>(_getAccountCirculationEvent);
  }

  _getAccountCirculationEvent(
      GetAccountCirculationEvent event, Emitter<AccountState> emit) async {
    emit(AccountCirculationLoadingState());
    try {
      final accountCirculation =
          await repository.getCirculationClass.getAccount(event.npm);
      emit(AccountCirculationSuccessState(accountCirculation));
    } catch (error) {
      emit(AccountCirculationErrorState());
    }
  }
}
