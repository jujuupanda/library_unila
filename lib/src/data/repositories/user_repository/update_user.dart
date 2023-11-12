part of 'user_repository.dart';

class UpdateUserClass {
  late String errorMessageChangePassword;

  updateUser(
    String npm,
    String addr,
    String phone,
    String email,
  ) async {
    final url = Uri.parse("http://172.16.1.47:4000/user/patchUser/$npm");
    final response = await http
        .patch(url, body: {"addr": addr, "phone": phone, "email": email});
    if (response.statusCode == 200) {
      print("update user repo ${response.body}");
    } else {
      print("update user repo ${response.body}");
    }
  }

  updatePassword(
    String npm,
    String oldPwd,
    String newPwd,
  ) async {
    errorMessageChangePassword = "";
    final url =
        Uri.parse("http://172.16.1.47:4000/user/patchUser/$npm/password");
    final response = await http.patch(url, body: {
      "oldPwd": oldPwd,
      "newPwd": newPwd,
    });
    if (response.statusCode == 200) {
      print("update user repo ${response.body}");
    } else {
      final resultError = jsonDecode(response.body);
      if (resultError['message'] == "Invalid password") {
        resultError['message'] = "Password lama Anda salah!";
      }
      return errorMessageChangePassword = resultError['message'];
    }
  }
}
