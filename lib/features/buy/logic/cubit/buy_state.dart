part of 'buy_cubit.dart';


abstract class BuyState  {}
class BuyInitial extends BuyState  {}
class OrderAdd extends BuyState  {}
class OrderDeleted extends BuyState  {}
class ChangeWayOfPayment extends BuyState  {}
class FinishOrder extends BuyState  {}
class ClearData extends BuyState  {}