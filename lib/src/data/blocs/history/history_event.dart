part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();
  @override
  List<Object> get props => [];
}

class GetHistoryEvent extends HistoryEvent {
  String npm;

  GetHistoryEvent(this.npm);
}

class PostHistoryEvent extends HistoryEvent {}
