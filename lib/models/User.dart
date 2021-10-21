class User {
  User({
    required this.name,
    required this.document,
    required this.email,
    required this.password,
    required this.userType,
    required this.address,
  });
  late final String name;
  late final String document;
  late final String email;
  late final String password;
  late final String userType;
  late final Address address;

  User.fromJson(Map<String, dynamic> json){
    name = json['name'];
    document = json['document'];
    email = json['email'];
    password = json['password'];
    userType = json['userType'];
    address = Address.fromJson(json['address']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['document'] = document;
    _data['email'] = email;
    _data['password'] = password;
    _data['userType'] = userType;
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
    required this.country,
    required this.zipCode,
    required this.region,
  });
  late final String street;
  late final int number;
  late final String city;
  late final String state;
  late final String country;
  late final String zipCode;
  late final String region;

  Address.fromJson(Map<String, dynamic> json){
    street = json['street'];
    number = json['number'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zipCode = json['zipCode'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['street'] = street;
    _data['number'] = number;
    _data['city'] = city;
    _data['state'] = state;
    _data['country'] = country;
    _data['zipCode'] = zipCode;
    _data['region'] = region;
    return _data;
  }
}