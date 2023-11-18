import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/history_model.dart';

part 'post_history.dart';
part 'get_history.dart';

class CirculationRepository {
  final getCirculationClass = GetHistoryClass();
  final postCirculationClass = PostHistoryClass();
}