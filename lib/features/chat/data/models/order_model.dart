import 'package:foodninja/features/buy/data/model/order_model.dart';

class OrderModle {
  List<FoodOrder> foodOrder = [];
  int cachedTime = DateTime.now().minute;
  String wayOfPayment;
  OrderModle({required this.foodOrder, required this.wayOfPayment});
}
