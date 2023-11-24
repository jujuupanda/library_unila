part of 'user_repository.dart';

class GetUserClass {
  Future getUser(String token) async {
    final jwtDecode = JwtDecoder.decode(token)['npm'];
    String url = '${UrlRepository().url}/user/getSingleUser/$jwtDecode';
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': token,
      });
      final result = UserModel.fromJson(jsonDecode(response.body)['data']);
      return result;
    } catch (error) {
      print(error);
    }

  }
}
