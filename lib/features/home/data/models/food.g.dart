// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllFood _$AllFoodFromJson(Map<String, dynamic> json) => AllFood(
      status: json['status'] as bool?,
      food: (json['data'] as List<dynamic>?)
          ?.map((e) => Food.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllFoodToJson(AllFood instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.food,
    };

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      restaurantId: json['restaurent_id'] as String?,
      catId: json['cat_id'] as String?,
      pic: json['pic'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'restaurent_id': instance.restaurantId,
      'cat_id': instance.catId,
      'pic': instance.pic,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
