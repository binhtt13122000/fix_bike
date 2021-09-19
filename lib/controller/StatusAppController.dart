import 'package:get/get.dart';

class StatusAppController extends GetxController {
  RxInt status = 1.obs;
  //1 - NORMAL
  //2 - FOUND
  //3 - BOOKED
  //4 - FIXED

  setStatus(int selectedStatus) {
    status.value = selectedStatus;
    update();
  }
}
