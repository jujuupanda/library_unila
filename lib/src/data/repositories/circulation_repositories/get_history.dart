part of 'history_repository.dart';

class GetHistoryClass {
  getHistory(String npm) async {
    final url = Uri.parse('http://172.16.1.47:4000/circulation/getCirculation/history');
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
    final url = Uri.parse('http://172.16.1.47:4000/circulation/getCirculation/status');
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

}
