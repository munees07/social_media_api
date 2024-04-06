class SignupModel {
  SignupModel({
    required this.email,
    required this.password,
    required this.username,
  });
  String? email;
  String? password;
  String? username;

  factory SignupModel.fromJson(Map<String, dynamic> json) {
    return SignupModel(
      email: json['email'],
      password: json['password'],
      username: json['username'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['email'] = email;
  //   _data['password'] = password;
  //   _data['username'] = username;
  //   return _data;
  // }
}
