import 'package:foodninja/features/home/data/models/food.dart';
import 'package:foodninja/features/home/data/models/restaurant.dart';

class FoodOrder {
  final Food food;
  final Restaurant restaurant;
  int _number = 1;
  FoodOrder(this.food, this.restaurant);
  void addItem() {
    _number++;
  }

  bool deleteItem() {
    if (_number > 1) {
      _number--;

      return true;
    }
    return false;
  }

  int get number => _number;
}
