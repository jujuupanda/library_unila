part of 'author_bloc.dart';

abstract class AuthorEvent extends Equatable {
  const AuthorEvent();

  @override
  List<Object> get props => [];
}

class GetAuthorBook extends AuthorEvent {
  String bibId;

  GetAuthorBook(this.bibId);
}
