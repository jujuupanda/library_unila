import 'dart:convert';

import 'package:library_unila/src/data/models/user_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;

import '../url_repository.dart';

part 'get_user.dart';

part 'update_user.dart';

class UserRepository {
  final getUserClass = GetUserClass();
  final updateUserClass = UpdateUserClass();
}
