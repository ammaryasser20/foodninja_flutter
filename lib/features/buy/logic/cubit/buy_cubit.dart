import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/core/resources/color_manager.dart';
import 'package:foodninja/core/resources/strings_manager.dart';
import 'package:foodninja/features/buy/data/model/order_model.dart';
import 'package:foodninja/features/home/data/models/food.dart';
import 'package:foodninja/features/home/data/models/restaurant.dart';
import 'package:foodninja/main.dart';

part 'buy_state.dart';

class BuyCubit extends Cubit<BuyState> {
  BuyCubit() : super(BuyInitial());
  static BuyCubit get(context) => BlocProvider.of(context);
  int total = 0;
  String wayOfPayment = "Cash.png";
  Map<int, FoodOrder> order = {};
  Map<String, TextEditingController> paymentController = {
    "paypal.svg": TextEditingController(),
    "visa.svg": TextEditingController(),
    "Payoneer.svg": TextEditingController(),
  };
  void addOrder(Food food, Restaurant restaurant, {bool needSnackBar = true}) {
    if (order.containsKey(food.id!)) {
      order[food.id]!.addItem();
    } else {
      order[food.id!] = FoodOrder(food, restaurant);
    }
    if (needSnackBar) {
      ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
          .showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 500),
        backgroundColor: ColorManager.primaryColor,
        content: Text(AppStrings.addedToChart),
      ));
    }
    emit(OrderAdd());
  }

  clearData() {
    total = 0;
    wayOfPayment = "Cash.png";
    order = {};
    paymentController = {
      "paypal.svg": TextEditingController(),
      "visa.svg": TextEditingController(),
      "Payoneer.svg": TextEditingController(),
    };
    emit(ClearData());
  }

  changeWayOfPayment(String wayOfPayment) {
    this.wayOfPayment = wayOfPayment;
    emit(ChangeWayOfPayment());
  }

  void removeItem(int id) {
    order.remove(id);
    emit(OrderDeleted());
  }

  int getTotal() {
    total = 0;
    order.forEach((key, value) {
      total = total + int.parse(value.food.price!) * value.number;
    });
    return total;
  }

  deleteOrder(Food food) {
    final isItDeleted = order[food.id!]!.deleteItem();
    if (isItDeleted) {
      emit(OrderDeleted());
    }
  }

  finishOrder() {
    order = {};
    emit(FinishOrder());
  }
}
