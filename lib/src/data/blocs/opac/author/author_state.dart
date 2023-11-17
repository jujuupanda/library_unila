part of 'author_bloc.dart';

abstract class AuthorState extends Equatable {
  const AuthorState();
}

class AuthorInitialState extends AuthorState {
  @override
  List<Object> get props => [];
}

class AuthorLoadingState extends AuthorState {
  @override
  List<Object> get props => [];
}

class AuthorSuccessState extends AuthorState {
  List<AuthorModel> authorModel;

  AuthorSuccessState(this.authorModel);

  @override
  List<Object> get props => [authorModel];
}

class AuthorErrorState extends AuthorState {
  @override
  List<Object> get props => [];
}
