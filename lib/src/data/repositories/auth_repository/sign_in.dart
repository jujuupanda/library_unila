part of 'auth_repository.dart';

class AuthSignIn {
  late String errorMessageSignIn;
  late String token;

  signIn(String npm, String password) async {
    errorMessageSignIn = "";
    token = "";
    String url = 'http://172.16.1.47:4000/auth/login';
    final response = await http.post(
      Uri.parse(url),
      body: {'npm': npm, 'password': password},
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return token = result['token'];
    } else {
      final resultError = jsonDecode(response.body);
      switch (resultError['message']){
        case "NPM not found":
          resultError['message'] = "NPM tidak ditemukan!";
          break;
        case "Invalid password":
          resultError['message'] = "Password salah!";
          break;
      }
      return errorMessageSignIn = resultError['message'];
    }
  }
}
