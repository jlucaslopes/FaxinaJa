class OrderRequest {
  OrderRequest({
    required this.serviceType,
    required this.serviceDate,
    required this.extraServices,
    required this.address,
  });
  late final String serviceType;
  late final String serviceDate;
  late final List<String> extraServices;
  late final Address address;

  OrderRequest.fromJson(Map<String, dynamic> json){
    serviceType = json['serviceType'];
    serviceDate = json['serviceDate'];
    extraServices = List.castFrom<dynamic, String>(json['extraServices']);
    address = Address.fromJson(json['address']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['serviceType'] = serviceType;
    _data['serviceDate'] = serviceDate;
    _data['extraServices'] = extraServices;
    _data['address'] = address.toJson();
    return _data;
  }
}

class Address {
  Address({
    required this.street,
    required this.number,
    required this.city,
  });
  late final String street;
  late final int number;
  late final String city;

  Address.fromJson(Map<String, dynamic> json){
    street = json['street'];
    number = json['number'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['street'] = street;
    _data['number'] = number;
    _data['city'] = city;
    return _data;
  }
}