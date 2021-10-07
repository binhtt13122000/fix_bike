import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fix_bike/models/OrderApp.dart';

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
}
