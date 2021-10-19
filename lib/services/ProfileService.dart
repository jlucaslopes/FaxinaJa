import 'dart:convert';

import 'package:faxina_ja_app/models/UserInfo.dart';
import 'package:http/http.dart' as http;

class ProfileService {

  final BASE_URL = 'http://10.0.2.2:3000/faxinaja-api/users/';

  Future<UserInfo> findUser(String token) async {
    var uri = Uri.parse(BASE_URL + 'find-user');

    var response = await http.get(
      uri,
      headers: {"Content-Type": "application/json","Authorization":token},);

    var json = jsonDecode(response.body);
    var user = UserInfo.fromJson(json);
    return user;
  }
}
