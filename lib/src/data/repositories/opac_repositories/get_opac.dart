part of 'opac_repository.dart';

class GetOpacClass {
  getOpac(String keyword) {
    final response = bookDb.map((e) => BookModels.fromJson(e)).where(
        (element) =>
            element.title!.toLowerCase().contains(keyword.toLowerCase()) ||
            element.noCallBook!.toLowerCase().contains(keyword.toLowerCase()) ||
            element.author!.toLowerCase().contains(keyword.toLowerCase())).toList();
    // final response = bookDb.map((e) => BookModels.fromJson(e)).toList();
    return response;
  }
}
