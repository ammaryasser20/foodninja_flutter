// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllRestaurant _$AllRestaurantFromJson(Map<String, dynamic> json) =>
    AllRestaurant(
      status: json['status'] as bool?,
      restaurant: (json['data'] as List<dynamic>?)
          ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllRestaurantToJson(AllRestaurant instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.restaurant,
    };

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      id: json['id'] as int?,
      pic: json['pic'] as String?,
      coverPhoto: json['cover_photo'] as String?,
      name: json['name'] as String?,
      deliveryTime: json['delivery_time'] as String?,
      tags1: json['tags1'] as String?,
      tags2: json['tags2'] as String?,
      verified: json['verified'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pic': instance.pic,
      'cover_photo': instance.coverPhoto,
      'name': instance.name,
      'delivery_time': instance.deliveryTime,
      'tags1': instance.tags1,
      'tags2': instance.tags2,
      'verified': instance.verified,
      'lat': instance.lat,
      'long': instance.long,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
