class UserInfo {
  UserInfo({
    required this.id,
    required this.name,
    required this.document,
    required this.password,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
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

  UserInfo.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    document = json['document'];
    password = json['password'];
    email = json['email'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
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
    return _data;
  }
}