import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/models/OrderApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatabaseMethods {
  Future addUserInfoToDB(
      String userId, Map<String, dynamic> userInfoMap) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userInfoMap);
  }

  Stream<List<OrderApp>> orderStream() {
    return FirebaseFirestore.instance
        .collection("order")
        .snapshots()
        .map((QuerySnapshot query) {
      List<OrderApp> retVal = [];
      query.docs.forEach((element) {
        retVal.add(OrderApp.fromSnapshot(element));
      });
      return retVal;
    });
  }

  Future<void> updateTodo(int status) async {
    try {
      FirebaseFirestore.instance
          .collection("order")
          .doc("n1zvnNRFTiEYgfnetGZg")
          .update({"status": status});
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> uploadImageToFirebase(
      BuildContext context, File file, int currentIndex) async {
    final StatusAppController statusAppController =
        Get.put(StatusAppController());
    Reference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('uploads/${DateTime.now().toString()}');
    UploadTask uploadTask = firebaseStorageRef.putFile(file);
    uploadTask.whenComplete(() => {
          firebaseStorageRef.getDownloadURL().then((value) => {
                FirebaseFirestore.instance
                    .collection("order")
                    .doc("n1zvnNRFTiEYgfnetGZg")
                    .update({"image${currentIndex + 1}": value}),
                statusAppController.setPath(value, currentIndex)
              })
        });
  }
}
