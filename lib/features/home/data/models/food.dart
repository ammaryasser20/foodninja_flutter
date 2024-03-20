import 'package:json_annotation/json_annotation.dart';
part 'food.g.dart';

@JsonSerializable()
class AllFood {
  bool? status;
  @JsonKey(name: "data")
  List<Food>? food;

  AllFood({this.status, this.food});

  factory AllFood.fromJson(Map<String, dynamic> json) =>
      _$AllFoodFromJson(json);
}

@JsonSerializable()
class Food {
  int? id;
  String? name;
  String? description;
  String? price;
  @JsonKey(name: "restaurent_id")
  String? restaurantId;
  @JsonKey(name: "cat_id")
  String? catId;
  String? pic;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  Food(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.restaurantId,
      this.catId,
      this.pic,
      this.createdAt,
      this.updatedAt});

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
}
