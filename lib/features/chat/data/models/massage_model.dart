class Message {
  String message;
  int code;
  final time = DateTime.now();
  Message({
    required this.message,
    required this.code,
  });
}
