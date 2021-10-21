import 'package:get/get.dart';

class StatusAppController extends GetxController {
  RxInt status = 1.obs;
  //1 - NORMAL
  //2 - FOUND
  //3 - BOOKED
  //4 - FIXED
  RxBool bringCar = false.obs;

  RxDouble zoom = 15.0.obs;
  RxBool switched = false.obs;
  RxBool isFinding = false.obs;
  RxBool isUpdatePurchase = false.obs;
  RxDouble totalPrice = 0.0.obs;
  RxString markerId = "".obs;
  setStatus(int selectedStatus) {
    status.value = selectedStatus;
    update();
  }

  RxList listReason = [
    "Thiếu phụ kiện",
    "Không thể sửa loại xe này",
    "Khác",
  ].obs;
  RxString reason = "".obs;

  setSwitch(bool currentBool) {
    switched.value = currentBool;
  }

  setMarkerId(String markID) {
    markerId.value = markID;
  }

  setFinding(bool currentStatus) {
    isFinding.value = currentStatus;
    update();
  }

  setUpdatePurchase(bool currentStatus) {
    isUpdatePurchase.value = currentStatus;
    update();
  }

  setTotalPrice(double price) {
    totalPrice.value = price;
    update();
  }
}
