// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'token': instance.token,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      name: json['name'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      otp: json['otp'] as int?,
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'mobile': instance.mobile,
      'otp': instance.otp,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'id': instance.id,
    };
