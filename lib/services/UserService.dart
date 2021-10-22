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

  void updateUser(String token, User user) async {
    var uri = Uri.parse(BASE_URL + 'update-user');

    print(jsonEncode(user));

    var response = await http.put(
        uri,
        headers: {"Content-Type": "application/json", "Authorization":token},
        body: jsonEncode(user) );

    print(response.body);
  }
}
