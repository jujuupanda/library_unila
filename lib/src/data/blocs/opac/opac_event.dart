part of 'opac_bloc.dart';

abstract class OpacEvent extends Equatable {
  const OpacEvent();

  @override
  List<Object> get props => [];
}

class GetOpacEvent extends OpacEvent {
  String keyword;

  GetOpacEvent(this.keyword);
}
