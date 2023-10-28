import 'package:library_unila/src/data/models/user_models.dart';
import 'package:library_unila/src/database/users_db.dart';

part 'get_user.dart';

part 'update_user.dart';

class UserRepository {
  final getUserClass = GetUserClass();
  final updateUserClass = UpdateUserClass();
}
