part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();
  @override
  List<Object> get props => [];
}

class GetHistoryEvent extends HistoryEvent {
  final String npm;

  const GetHistoryEvent(this.npm);
}
