part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();
}

class HistoryInitialState extends HistoryState {
  @override
  List<Object> get props => [];
}
class HistoryLoadingState extends HistoryState {
  @override
  List<Object> get props => [];
}

//History

class GetHistorySuccessState extends HistoryState {
  List<BorrowModels> listHistory;

  GetHistorySuccessState(this.listHistory);

  @override
  List<Object> get props => [];
}

class GetHistoryErrorState extends HistoryState {
  @override
  List<Object> get props => [];
}

class PostHistorySuccessState extends HistoryState {
  @override
  List<Object> get props => [];
}

class PostHistoryErrorState extends HistoryState {
  @override
  List<Object> get props => [];
}
