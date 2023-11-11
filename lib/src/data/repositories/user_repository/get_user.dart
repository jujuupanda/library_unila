part of 'user_repository.dart';

class GetUserClass {
  getUser(String token) async {
    String url = 'http://172.16.1.47:4000/user/getUser';
    final response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization'
          '': 'Bearer $token',
    });
    print(jsonDecode(response.body));

    // final response = userDb.map((e) => UserModels.fromJson(e)).toList();
    // final result = response.where((element) => element.npm == token).toList();
    // return result;
  }
}
