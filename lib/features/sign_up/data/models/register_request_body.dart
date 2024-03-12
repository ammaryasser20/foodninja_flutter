

import 'package:json_annotation/json_annotation.dart';

part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  String name;
  String email;
  String password;
  String mobile;
  RegisterRequestBody({
    required this.name,
    required this.email,
    required this.password,
    this.mobile = '0000',
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);

}
