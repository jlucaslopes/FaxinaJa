import 'dart:convert';

import 'package:faxina_ja_app/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserService {

  final BASE_URL = 'http://10.0.2.2:3000/faxinaja-api/users/';

  void saveUser(User user) async {
    var uri = Uri.parse(BASE_URL + 'create-user');

    var response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
    body: jsonEncode(user) );
  }
}
