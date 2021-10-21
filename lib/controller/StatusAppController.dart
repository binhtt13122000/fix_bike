import 'package:get/get.dart';

class StatusAppController extends GetxController {
  RxInt status = 1.obs;
  //1 - NORMAL
  //2 - FOUND
  //3 - BOOKED
  //4 - FIXED

  RxDouble zoom = 15.0.obs;
  RxBool switched = false.obs;
  RxBool isFinding = false.obs;
  RxString markerId = "".obs;
  RxString img1 = "".obs;
  RxString img2 = "".obs;
  RxString img3 = "".obs;

  RxList listReason = [
    "Đã có một người sửa xe khác giúp đỡ",
    "Đã có người nhà tới hỗ trợ",
    "Đã tìm được một tiệm sửa xe gần đây",
    "Khác",
  ].obs;
  RxString reason = "".obs;

  setPath(String path, int index) {
    switch (index) {
      case 0:
        {
          print("DAN: " + path);
          img1.value = path;
          update();
          break;
        }
      case 1:
        {
          img2.value = path;
          update();
          break;
        }
      case 2:
        {
          img3.value = path;
          update();
          break;
        }
    }
    update();
  }

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

  setFinding(bool currentStatus) {
    isFinding.value = currentStatus;
    update();
  }
}
