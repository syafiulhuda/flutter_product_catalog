import 'dart:convert';

class UserLogin {
  final String? token;
  final String? refreshToken;
  final int? id;
  final String? username;
  final String? password;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;

  UserLogin({
    this.token,
    this.refreshToken,
    this.id,
    this.username,
    this.password,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
  });

  factory UserLogin.fromJson(String str) => UserLogin.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserLogin.fromMap(Map<String, dynamic> json) => UserLogin(
        token: json["token"] as String?,
        refreshToken: json["refreshToken"] as String?,
        id: json["id"] as int?,
        username: json["username"] as String?,
        password: json["password"] as String?,
        email: json["email"] as String?,
        firstName: json["firstName"] as String?,
        lastName: json["lastName"] as String?,
        gender: json["gender"] as String?,
        image: json["image"] as String?,
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "refreshToken": refreshToken,
        "id": id,
        "username": username,
        "password": password,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
      };
}
