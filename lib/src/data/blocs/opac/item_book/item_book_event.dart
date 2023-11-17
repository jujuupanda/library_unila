part of 'item_book_bloc.dart';

abstract class ItemBookEvent extends Equatable {
  const ItemBookEvent();

  @override
  List<Object> get props => [];
}

class GetItemBookEvent extends ItemBookEvent {
  String bibId;

  GetItemBookEvent(this.bibId);
}
