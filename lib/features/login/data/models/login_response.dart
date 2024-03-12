import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  User? user;
  String? token;
  bool? status;

  LoginResponse({this.user, this.token, this.status});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? emailVerifiedAt;
  String? otp;
  String? avatar;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.mobile,
      this.email,
      this.emailVerifiedAt,
      this.otp,
      this.avatar,
      this.createdAt,
      this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
