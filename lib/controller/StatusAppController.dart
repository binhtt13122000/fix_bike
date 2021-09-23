import 'package:get/get.dart';

class StatusAppController extends GetxController {
  RxInt status = 1.obs;
  //1 - NORMAL
  //2 - FOUND
  //3 - BOOKED
  //4 - FIXED

  RxDouble zoom = 15.0.obs;
  RxBool switched = false.obs;
  RxString markerId = "".obs;
  setStatus(int selectedStatus) {
    status.value = selectedStatus;
    update();
  }

  setSwitch(bool currentBool) {
    switched.value = currentBool;
  }

  setMarkerId(String markID) {
    markerId.value = markID;
  }
}
