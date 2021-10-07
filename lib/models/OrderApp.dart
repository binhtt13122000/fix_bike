import 'package:cloud_firestore/cloud_firestore.dart';

class OrderApp {
  // Header members
  String feedback;
  String money;
  int rating;
  String repairman;
  int status;
  String user;

  OrderApp.fromSnapshot(DocumentSnapshot snapshot)
      : feedback = snapshot['feedback'],
        money = snapshot['money'],
        rating = snapshot['rating'],
        repairman = snapshot['repairman'],
        status = snapshot['status'],
        user = snapshot['user'];
}
