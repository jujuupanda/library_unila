part of 'opac_bloc.dart';

abstract class OpacState extends Equatable {
  const OpacState();
}

class OpacInitialState extends OpacState {
  @override
  List<Object> get props => [];
}

class OpacLoadingState extends OpacState {
  @override
  List<Object> get props => [];
}

class GetOpacSuccessState extends OpacState {
  List<BookModel> listBook;

  GetOpacSuccessState(this.listBook);

  @override
  List<Object> get props => [];
}

class GetOpacErrorState extends OpacState {
  @override
  List<Object> get props => [];
}
