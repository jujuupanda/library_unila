import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:library_unila/src/data/models/account_circulation_model.dart';

import '../../models/history_model.dart';

part 'post_circulation.dart';
part 'get_circulation.dart';

class CirculationRepository {
  final getCirculationClass = GetHistoryClass();
  final postCirculationClass = PostHistoryClass();
}