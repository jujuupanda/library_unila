import 'package:library_unila/src/data/models/borrow_models.dart';
import 'package:library_unila/src/database/borrows_db.dart';

import '../../../database/histories_db.dart';

part 'get_borrow.dart';


part 'post_borrow.dart';


class BorrowRepository {
  final getBorrowClass = GetBorrowClass();
  final postBorrowClass = PostBorrowClass();

}
