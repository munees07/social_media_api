class AuthModel {
  AuthModel({
    required this.email,
    required this.password,
     this.username,
  });
  String? email;
  String? password;
  String? username;

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      password: json['password'],
      username: json['username'],
    );
  }
  Map<String, dynamic> toJson() {
    final data = {'email': email, 'password': password, 'username': username};
    return data;
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['email'] = email;
  //   _data['password'] = password;
  //   _data['username'] = username;
  //   return _data;
  // }
}

class UserModel {
  String? username;
  String? email;
  String? password;
  bool? isAdmin;
  List<dynamic>? followers;
  List<dynamic>? following;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;

  UserModel(
      {this.username,
      this.email,
      this.password,
      this.isAdmin,
      this.followers,
      this.following,
      this.id,
      this.createdAt,
      this.updatedAt,
      this.v});

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    email = json["email"];
    password = json["password"];
    isAdmin = json["isAdmin"];
    followers = json["followers"] ?? [];
    following = json["following"] ?? [];
    id = json["_id"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
  }

  // Map<String, dynamic> toJson() {
  //     final Map<String, dynamic> _data = <String, dynamic>{};
  //     _data["username"] = username;
  //     _data["email"] = email;
  //     _data["password"] = password;
  //     _data["isAdmin"] = isAdmin;
  //     if(followers != null) {
  //         _data["followers"] = followers;
  //     }
  //     if(following != null) {
  //         _data["following"] = following;
  //     }
  //     _data["_id"] = id;
  //     _data["createdAt"] = createdAt;
  //     _data["updatedAt"] = updatedAt;
  //     _data["__v"] = v;
  //     return _data;
  // }
}
