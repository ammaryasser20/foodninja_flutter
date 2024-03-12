// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'status': instance.status,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['emailVerifiedAt'] as String?,
      otp: json['otp'] as String?,
      avatar: json['avatar'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mobile': instance.mobile,
      'email': instance.email,
      'emailVerifiedAt': instance.emailVerifiedAt,
      'otp': instance.otp,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
