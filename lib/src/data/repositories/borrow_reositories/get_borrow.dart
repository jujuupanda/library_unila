part of 'borrow_repository.dart';

class GetBorrowClass {
  getBorrow(String npm) async {
    final response = borrowDb.map((e) => BorrowModels.fromJson(e)).toList();
    final result = response.where((element) => element.npm == npm).toList();
    return result;
  }
}
