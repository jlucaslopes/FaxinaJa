import 'dart:convert';

import 'package:faxina_ja_app/models/OrderRequest.dart';
import 'package:http/http.dart' as http;

class OrderService {

  final BASE_URL = 'http://10.0.2.2:3000/faxinaja-api/demand/';

  void createDemand(OrderRequest orderRequest, String token) async {
    var uri = Uri.parse(BASE_URL + 'create-demand');

     http.post(
      uri,
      body: jsonEncode(orderRequest.toJson()),
      headers: {"Content-Type": "application/json","Authorization":token},)
         .then((response) => print(response.body))
         .catchError((onError) => print(onError));
  }
}
