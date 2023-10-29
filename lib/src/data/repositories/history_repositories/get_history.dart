part of 'history_repository.dart';

class GetHistoryClass {
  getHistory(String npm) async {
    final response = historyDb.map((e) => BorrowModels.fromJson(e)).toList();
    final result = response.where((element) => element.npm == npm).toList();
    return result;
  }
}
