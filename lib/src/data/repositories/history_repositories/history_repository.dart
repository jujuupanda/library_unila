import '../../../database/histories_db.dart';
import '../../models/borrow_models.dart';

part 'post_history.dart';
part 'get_history.dart';

class HistoryRepository {
  final getHistoryClass = GetHistoryClass();
  final postHistoryClass = PostHistoryClass();
}