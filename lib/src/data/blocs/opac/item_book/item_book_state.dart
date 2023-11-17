part of 'item_book_bloc.dart';

abstract class ItemBookState extends Equatable {
  const ItemBookState();
}

class ItemBookInitialState extends ItemBookState {
  @override
  List<Object> get props => [];
}

class ItemBookSuccessState extends ItemBookState {
  List<ItemBookModel> listItemBook;

  ItemBookSuccessState(this.listItemBook);

  @override
  List<Object> get props => [listItemBook];
}

class ItemBookErrorState extends ItemBookState {
  @override
  List<Object> get props => [];
}

class ItemBookLoadingState extends ItemBookState {
  @override
  List<Object> get props => [];
}
