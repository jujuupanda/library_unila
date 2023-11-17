part of 'opac_repository.dart';

class GetOpacClass {
  getOpac(String keyword) async {
    final url = Uri.parse('http://172.16.1.47:4000/book/getBook');
    try {
      final response = await http.post(url, body: {"title": keyword});

      if (response.statusCode == 200) {
        List<dynamic> dynamicResponse = jsonDecode(response.body)['data'];
        final listBook =
            dynamicResponse.map((e) => BookModel.fromJson(e)).toList();
        return listBook;
      } else {
        List<BookModel> listBook = [];
        return listBook;
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  getItemBook(String bibId) async {
    final url = Uri.parse('http://172.16.1.47:4000/book/getBook/itemBook');
    try {
      final response = await http.post(url, body: {"bibId": bibId});
      if (response.statusCode == 200) {
        List<dynamic> dynamicResponse = jsonDecode(response.body)['data'];
        final listBook =
            dynamicResponse.map((e) => ItemBookModel.fromJson(e)).toList();
        return listBook;
      } else {
        List<ItemBookModel> listItemBook = [];
        return listItemBook;
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  getAuthorBook(String bibId) async {
    final url = Uri.parse('http://172.16.1.47:4000/book/getBook/authorBook');
    try {
      final response = await http.post(url, body: {"bibId": bibId});
      if (response.statusCode == 200) {
        List<dynamic> dynamicResponse = jsonDecode(response.body)['data'];
        final listAuthor =
            dynamicResponse.map((e) => AuthorModel.fromJson(e)).toList();
        return listAuthor;
      } else {
        List<AuthorModel> listAuthor = [];
        return listAuthor;
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
