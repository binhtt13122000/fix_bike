import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fix_bike/models/OrderApp.dart';
import 'package:fix_bike/screens/Home.dart';
import 'package:fix_bike/services/Auth.dart';
import 'package:fix_bike/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var isLoading = false.obs;
  Rx<List<OrderApp>> orderApp = Rx<List<OrderApp>>([]);

  OrderApp get singleOrderApp => orderApp.value.first;
  @override
  void onInit() {
    orderApp.bindStream(
        DatabaseMethods().orderStream()); //stream coming from firebase
    super.onInit();
    print("a");
  }
}
