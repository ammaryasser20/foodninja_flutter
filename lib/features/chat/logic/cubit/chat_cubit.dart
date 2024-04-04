import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodninja/features/buy/data/model/order_model.dart';

import 'package:foodninja/features/chat/data/models/massage_model.dart';

import 'package:foodninja/features/chat/data/models/order_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);
  List<OrderModle> order = [];
  List<Message> chat = [];
  bool isItViewed = false;
  void addOrder(
      {required Map<int, FoodOrder> orders, required String wayOfPayment}) {
    isItViewed = false;
    List<FoodOrder> foodOrder = [];
    String orderMassage = 'Thank you for confirming your order!\nYour Order : ';
    orders.forEach((key, value) {
      foodOrder.add(value);
      orderMassage = "$orderMassage \n ${value.food.name} × ${value.number}";
    });
    orderMassage = "$orderMassage \non my way";
    order.add(OrderModle(foodOrder: foodOrder, wayOfPayment: wayOfPayment));

    chat.insert(0, Message(code: 0, message: orderMassage));

    emit(OrderAdded());
  }

  clearData() {
    order = [];
    chat = [];
    isItViewed = false;
    emit(ClearData());
  }

  chatOpened() {
    isItViewed = true;
    emit(ChatOpened());
  }

  sendMassage(String massage) {
    chat.insert(0, Message(message: massage, code: 1));

    emit(SendMassage());
  }
}
