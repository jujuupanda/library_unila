import 'dart:convert';

import 'package:http/http.dart' as http;
part 'sign_in.dart';
part 'sign_out.dart';

class AuthRepository {
  final signInClass = AuthSignIn();
  final signOutClass = AuthSignOut();
}