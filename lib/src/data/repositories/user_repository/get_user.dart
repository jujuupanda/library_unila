part of 'user_repository.dart';

class GetUserClass {
  Future getUser(String token) async {
    final jwtDecode = JwtDecoder.decode(token)['npm'];
    print(JwtDecoder.decode(token));
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

  Future getUserSSO(String token) async {
    final jwtDecode = JwtDecoder.decode(token)['fname'];
    final name = jwtDecode.toString().toLowerCase();
    String url = '${UrlRepository().url}/user/getUserSSO/$name';
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
