class Order {
  late String customerName;
  late String price;
  late String status;
  late String date;
  Order({required this.customerName, required this.price, required this.status, required this.date});
  String get name => customerName;
  String get priceOrder => price;
  String get statusOrder => status;
  String get dateOrder => date;

  set name(String customerName) {
    this.customerName = customerName;
  }
}