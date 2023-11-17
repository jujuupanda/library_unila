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
  List<AuthorModel> listAuthor;

  AuthorSuccessState(this.listAuthor);

  @override
  List<Object> get props => [listAuthor];
}

class AuthorErrorState extends AuthorState {
  @override
  List<Object> get props => [];
}
