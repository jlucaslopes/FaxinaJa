import 'dart:html';

import 'package:http/http.dart' as http;

class AuthService {
  Uri uri = Uri(host: "URL DO ENDPOINT DE AUTENTICACAO");

  Future login() async {
    var response = http.get(uri);
    print(response);
  }
}
