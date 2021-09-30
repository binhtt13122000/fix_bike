class Promo {
  late String promo;
  late String message;
  late String date;
  Promo({required this.promo, required this.message, required this.date});
  String get numPro => promo;
  String get messagePro => message;
  String get datePro => date;
}