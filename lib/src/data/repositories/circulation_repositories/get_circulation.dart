part of 'circulation_repository.dart';

class GetHistoryClass {
  getHistory(String npm) async {
    final url =
        Uri.parse('${UrlRepository().url}/circulation/getCirculation/history');
    try {
      final response = await http.post(url, body: {"npm": npm});
      if (response.statusCode == 200) {
        List<dynamic> dynamicResponse = jsonDecode(response.body)['data'];
        final listHistory =
            dynamicResponse.map((e) => HistoryModel.fromJson(e)).toList();
        return listHistory;
      } else {
        List<HistoryModel> listHistory = [];
        return listHistory;
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  getStatus(String npm) async {
    final url =
        Uri.parse('${UrlRepository().url}/circulation/getCirculation/status');
    try {
      final response = await http.post(url, body: {"npm": npm});
      if (response.statusCode == 200) {
        List<dynamic> dynamicResponse = jsonDecode(response.body)['data'];
        final listHistory =
            dynamicResponse.map((e) => HistoryModel.fromJson(e)).toList();
        return listHistory;
      } else {
        List<HistoryModel> listHistory = [];
        return listHistory;
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  getAccount(String npm) async {
    final url =
        Uri.parse('${UrlRepository().url}/circulation/getCirculation/account');
    try {
      final response = await http.post(url, body: {"npm": npm});
      if (response.statusCode == 200) {
        List<dynamic> dynamicResponse = jsonDecode(response.body)['data'];
        final listAccount = dynamicResponse
            .map((e) => AccountCirculationModel.fromJson(e))
            .toList();
        return listAccount;
      } else {
        List<AccountCirculationModel> listAccount = [];
        return listAccount;
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
