class OrderResponse {
  OrderResponse({
    required this.id,
    required this.status,
    required this.serviceDate,
    required this.extraServices,
    required this.clientId,
    required this.professionalId,
    required this.serviceType,
    required this.serviceValue,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String status;
  late final String serviceDate;
  late final List<dynamic> extraServices;
  late final String clientId;
  late final String professionalId;
  late final String serviceType;
  late final int serviceValue;
  late final Address address;
  late final String createdAt;
  late final String updatedAt;

  OrderResponse.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    status = json['status'];
    serviceDate = json['serviceDate'];
    extraServices = List.castFrom<dynamic, dynamic>(json['extraServices']);
    clientId = json['clientId'];
    professionalId = json['professionalId'];
    serviceType = json['serviceType'];
    serviceValue = json['serviceValue'];
    address = Address.fromJson(json['address']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['status'] = status;
    _data['serviceDate'] = serviceDate;
    _data['extraServices'] = extraServices;
    _data['clientId'] = clientId;
    _data['professionalId'] = professionalId;
    _data['serviceType'] = serviceType;
    _data['serviceValue'] = serviceValue;
    _data['address'] = address.toJson();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
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