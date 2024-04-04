part of 'chat_cubit.dart';

  
 abstract class ChatState {}
class ChatInitial extends ChatState {}
class OrderAdded extends ChatState {}
class SendMassage extends ChatState {}
class ChatOpened extends ChatState {}
class ClearData extends ChatState {}