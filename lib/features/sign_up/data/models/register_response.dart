import 'package:json_annotation/json_annotation.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  bool? status;
  Data? data;
  String? token;

  RegisterResponse({this.status, this.data, this.token});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> registerResponseToJson() =>
      _$RegisterResponseToJson(this);
}

@JsonSerializable()
class Data {
  String? name;
  String? email;
  String? mobile;
  int? otp;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "created_at")
  String? createdAt;
  int? id;

  Data(
      {this.name,
      this.email,
      this.mobile,
      this.otp,
      this.updatedAt,
      this.createdAt,
      this.id});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> dataToJson() => _$DataToJson(this);
}
