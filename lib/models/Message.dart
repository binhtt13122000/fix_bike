class Message {
  late String messageText;
  late String urlImage;
  late bool isSend;
  Message({required this.messageText, required this.urlImage, required this.isSend});
  String get textMsg => messageText;
  String get url => urlImage;
  bool get isSender => isSend;
}