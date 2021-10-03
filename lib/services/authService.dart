import 'dart:convert';

import 'package:faxina_ja_app/models/AuthObject.dart';
import 'package:http/http.dart' as http;

class AuthService {
  var uri = Uri.parse('http://10.0.2.2:3000/faxinaja-api/auth');

  Future<String> login(String email, String senha) async {
    AuthObject authObject = new AuthObject(email, senha);

    var response = await http.post(
      uri,
      body: jsonEncode(authObject.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    var json = jsonDecode(response.body);

    return json['token'] == null ? "" : json['token'];
  }
}
