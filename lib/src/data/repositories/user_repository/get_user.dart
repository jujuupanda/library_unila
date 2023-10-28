part of 'user_repository.dart';

class GetUserClass {
  getUser(String token) async {
    final response = userDb.map((e) => UserModels.fromJson(e)).toList();
    final result = response.where((element) => element.npm == token).toList();
    return result;
  }
}
