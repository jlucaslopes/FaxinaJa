class AuthObjectResponse {
  String token;
  String name;
  String email;

  AuthObjectResponse(
      {required this.token, required this.name, required this.email});

  AuthObjectResponse.fromJson(Map<String, dynamic> json)
      : token = json['token'] ?? json['token'],
        name = json['name'] ?? json['name'],
        email = json['email'] ?? json['email'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
