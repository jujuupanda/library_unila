part of 'user_repository.dart';

class UpdateUserClass {
  late String errorMessageChangePassword;

  updateUser(
    String npm,
    String addr,
    String phone,
    String email,
  ) async {
    final url = Uri.parse("${UrlRepository().url}/user/patchUser/$npm");
    final response = await http
        .patch(url, body: {"addr": addr, "phone": phone, "email": email});
    if (response.statusCode == 200) {
      print("patch success ${response.body}");
    } else {
      print("patch failed ${response.body}");
    }
  }

  updatePassword(
    String npm,
    String oldPwd,
    String newPwd,
  ) async {
    errorMessageChangePassword = "";
    final url =
        Uri.parse("${UrlRepository().url}/user/patchUser/$npm/passwordMd5");
    final response = await http.patch(url, body: {
      "oldPwd": oldPwd,
      "newPwd": newPwd,
    });
    if (response.statusCode == 200) {
      print("patch password success ${response.body}");
    } else {
      final resultError = jsonDecode(response.body);
      if (resultError['message'] == "Invalid password") {
        resultError['message'] = "Password lama Anda salah!";
      }
      return errorMessageChangePassword = resultError['message'];
    }
  }
}
