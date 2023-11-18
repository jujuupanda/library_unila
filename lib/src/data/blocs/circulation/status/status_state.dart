part of 'status_bloc.dart';

abstract class StatusState extends Equatable {
  const StatusState();
}

class StatusInitialState extends StatusState {
  @override
  List<Object> get props => [];
}

class StatusLoadingState extends StatusState {
  @override
  List<Object> get props => [];
}


class GetStatusSuccessState extends StatusState {
  final List<HistoryModel> listStatus;

  const GetStatusSuccessState(this.listStatus);

  @override
  List<Object> get props => [];
}


class GetStatusErrorState extends StatusState {
  @override
  List<Object> get props => [];
}
