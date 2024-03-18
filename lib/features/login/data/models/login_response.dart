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
  Map<String, dynamic> loginResponseToJson() {
    return <String, dynamic>{
      'user': user!.userToJson(),
      'token': token,
      'status': status,
    };
  }
}

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? mobile;
  String? email;
  @JsonKey(name: "email_verified_at")
  String? emailVerifiedAt;
  String? otp;
  String? avatar;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "created_at")
  String? createdAt;

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
  Map<String, dynamic> userToJson() => _$UserToJson(this);
}
