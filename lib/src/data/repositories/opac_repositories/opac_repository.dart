
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:library_unila/src/data/models/author_model.dart';

import '../../models/book_model.dart';
import '../../models/item_book_model.dart';


part 'get_opac.dart';

class OpacRepository {
  final getOpacClass = GetOpacClass();
}