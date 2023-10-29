part of 'borrow_bloc.dart';

abstract class BorrowState extends Equatable {
  const BorrowState();
}

class BorrowInitialState extends BorrowState {
  @override
  List<Object> get props => [];
}

class BorrowLoadingState extends BorrowState {
  @override
  List<Object> get props => [];
}

//Borrow
class GetBorrowSuccessState extends BorrowState {
  List<BorrowModels> listBorrow;

  GetBorrowSuccessState(this.listBorrow);

  @override
  List<Object> get props => [];
}

class GetBorrowErrorState extends BorrowState {
  @override
  List<Object> get props => [];
}

class PostBorrowSuccessState extends BorrowState {
  @override
  List<Object> get props => [];
}

class PostBorrowErrorState extends BorrowState {
  @override
  List<Object> get props => [];
}




