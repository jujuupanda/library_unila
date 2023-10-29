part of 'borrow_bloc.dart';

abstract class BorrowEvent extends Equatable {
  const BorrowEvent();

  @override
  List<Object> get props => [];
}

class GetBorrowEvent extends BorrowEvent {
  String npm;

  GetBorrowEvent(this.npm);
}


class PostBorrowEvent extends BorrowEvent {}

