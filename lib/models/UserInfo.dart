import 'package:faxina_ja_app/models/OrderRequest.dart';

class UserInfo {
  UserInfo({
    required this.id,
    required this.name,
    required this.document,
    required this.password,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.address,
  });

  UserInfo.empty(){
    id = "";
    name = "";
    document = "";
    password = "";
    email = "";
    createdAt = "";
    updatedAt = "";
  }

  late final String id;
  late final String name;
  late final String document;
  late final String password;
  late final String email;
  late final String createdAt;
  late final String updatedAt;
  late final Address address;

  UserInfo.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    document = json['document'];
    password = json['password'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    address = Address.fromJson(json['address']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['document'] = document;
    _data['password'] = password;
    _data['email'] = email;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['address'] = address.toJson();
    return _data;
  }
}



class Address {
  Address({
    required this.street,
    required this.number,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.region,
  });
  late final String street;
  late final int number;
  late final String city;
  late final String state;
  late final String zipCode;
  late final String region;

  Address.fromJson(Map<String, dynamic> json){
    street = json['street'];
    number = json['number'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zipCode'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['street'] = street;
    _data['number'] = number;
    _data['city'] = city;
    _data['state'] = state;
    _data['zipCode'] = zipCode;
    _data['region'] = region;
    return _data;
  }
}