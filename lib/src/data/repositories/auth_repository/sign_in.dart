part of 'auth_repository.dart';

class AuthSignIn {
  late String errorMessageSignIn;
  late String token;

  signIn(String npm, String password) async {
    errorMessageSignIn = "";
    if (npm == "1915061008" && password == "1915061008") {
      return token = "1915061008";
    } else if (npm == "1915061001" && password == "1915061001") {
      return token = "1915061001";
    } else {
      return errorMessageSignIn = "NPM atau Password salah!";
    }
  }
}
