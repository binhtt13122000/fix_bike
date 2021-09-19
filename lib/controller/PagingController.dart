import 'package:fix_bike/screens/Home.dart';
import 'package:fix_bike/screens/NotificationScreen.dart';
import 'package:fix_bike/screens/ProfileScreen.dart';
import 'package:get/get.dart';

class PagingController extends GetxController {
  RxInt currentIndex = 0.obs;

  onChangeRoute(int index) {
    if (index != currentIndex.value) {
      Transition transition = Transition.rightToLeftWithFade;
      if (currentIndex.value > index) {
        transition = Transition.rightToLeftWithFade;
      } else {
        transition = Transition.leftToRightWithFade;
      }
      currentIndex.value = index;
      switch (index) {
        case 0:
          Get.to(() => Home(),
              transition: transition, duration: Duration(milliseconds: 600));
          break;
        case 1:
          Get.to(() => ProfilePage(),
              transition: transition, duration: Duration(milliseconds: 600));
          break;
        case 2:
          Get.to(() => NotificationPage(),
              transition: transition, duration: Duration(milliseconds: 600));
          break;
        default:
          break;
      }
    }
  }
}
