class OrderRequest {
  OrderRequest({
    required this.status,
    required this.clientId,
    required this.professionalId,
    required this.serviceType,
    required this.serviceValue,
    required this.address,
  });
  late final String status;
  late final String clientId;
  late final String professionalId;
  late final String serviceType;
  late final int serviceValue;
  late final Address address;

  OrderRequest.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    clientId = json['clientId'];
    professionalId = json['professionalId'];
    serviceType = json['serviceType'];
    serviceValue = json['serviceValue'];
    address = Address.fromJson(json['address']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['clientId'] = clientId;
    _data['professionalId'] = professionalId;
    _data['serviceType'] = serviceType;
    _data['serviceValue'] = serviceValue;
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

  Address.fromJson(Map<String, dynamic> json) {
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
