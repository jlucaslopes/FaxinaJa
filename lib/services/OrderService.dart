import 'dart:convert';

import 'package:faxina_ja_app/models/OrderRequest.dart';
import 'package:faxina_ja_app/models/OrderResponse.dart';
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

  Future<List<OrderResponse>> findMyOpenedDemands(String token) async {
    var uri = Uri.parse(BASE_URL + 'find-my-demands');

    var response = await http.get(
      uri,
      headers: {"Content-Type": "application/json","Authorization":token},);
    print(response.body);
    List<dynamic> json = jsonDecode(response.body);

    List<OrderResponse> myDemands = json
        .map<OrderResponse>(
            (resp) => OrderResponse.fromJson(resp))
        .toList();

    return myDemands;
  }

  Future<List<OrderResponse>> findOpenOrders(String token) async {
    var uri = Uri.parse(BASE_URL + 'find-open-demands');

    var response = await http.get(
      uri,
      headers: {"Content-Type": "application/json","Authorization":token},);

    List<dynamic> json = jsonDecode(response.body);

    List<OrderResponse> myDemands = json
        .map<OrderResponse>(
            (resp) => OrderResponse.fromJson(resp))
        .toList();

    return myDemands;
  }

  Future<List<OrderResponse>> findMyMadeDemands(String token) async {
    var uri = Uri.parse(BASE_URL + 'find-my-made-demands');

    var response = await http.get(
      uri,
      headers: {"Content-Type": "application/json","Authorization":token},);

    List<dynamic> json = jsonDecode(response.body);

    List<OrderResponse> myDemands = json
        .map<OrderResponse>(
            (resp) => OrderResponse.fromJson(resp))
        .toList();

    return myDemands;
  }


  Future<void> assignDemandToProfessional(String token, String demandId) async {
    var uri = Uri.parse(BASE_URL + 'assign-demand/'+demandId);

    await http.post(
      uri,
      headers: {"Content-Type": "application/json","Authorization":token},);

  }
}
