part of 'status_bloc.dart';

abstract class StatusEvent extends Equatable {
  const StatusEvent();
  @override
  List<Object> get props => [];
}

class GetStatusEvent extends StatusEvent {
  final String npm;

  const GetStatusEvent(this.npm);
}