import 'package:json_annotation/json_annotation.dart';
part 'restaurant.g.dart';

@JsonSerializable()
class AllRestaurant {
  bool? status;
  @JsonKey(name: "data")
  List<Restaurant>? restaurant;

  AllRestaurant({this.status, this.restaurant});
  factory AllRestaurant.fromJson(Map<String, dynamic> json) =>
      _$AllRestaurantFromJson(json);
}

@JsonSerializable()
class Restaurant {
  int? id;
  String? pic;
  @JsonKey(name: "cover_photo")
  String? coverPhoto;
  String? name;
  @JsonKey(name: "delivery_time")
  String? deliveryTime;
  String? tags1;
  String? tags2;
  String? verified;
  String? lat;
  String? long;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  Restaurant(
      {this.id,
      this.pic,
      this.coverPhoto,
      this.name,
      this.deliveryTime,
      this.tags1,
      this.tags2,
      this.verified,
      this.lat,
      this.long,
      this.createdAt,
      this.updatedAt});
  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}
