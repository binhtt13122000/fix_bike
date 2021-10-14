import 'package:cloud_firestore/cloud_firestore.dart';

class OrderApp {
  // Header members
  String feedback;
  String money;
  String image1;
  String image2;
  String image3;
  int rating;
  String repairman;
  int status;
  String user;

  OrderApp.fromSnapshot(DocumentSnapshot snapshot)
      : feedback = snapshot['feedback'],
        money = snapshot['money'],
        rating = snapshot['rating'],
        image1 = snapshot['image1'],
        image2 = snapshot['image2'],
        image3 = snapshot['image3'],
        repairman = snapshot['repairman'],
        status = snapshot['status'],
        user = snapshot['user'];
}
