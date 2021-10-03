class AuthObject {
  String email;
  String password;

  AuthObject(this.email, this.password);

  AuthObject.fromJson(Map<String, dynamic> json)
      : email = json['email'] ?? json['email'],
        password = json['password'] ?? json['password'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
