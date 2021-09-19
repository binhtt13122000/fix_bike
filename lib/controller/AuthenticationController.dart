import 'package:fix_bike/screens/Home.dart';
import 'package:fix_bike/services/Auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  authenticationWithUsernameAndPassword(
      BuildContext context, String userName, String password) async {
    isLoading.value = true;
    try {
      var user = await AuthMethods()
          .signInWithUsernameAndPassword(context, userName, password);
      if (user != null) {
        Get.offAll(() => Home(),
            transition: Transition.leftToRightWithFade,
            duration: Duration(milliseconds: 500));
      }
    } catch (_) {
      printError(info: "Error");
    } finally {
      isLoading.value = false;
    }
  }

  authenticationWithGoogle(BuildContext context) async {
    isLoading.value = true;
    try {
      var user = await AuthMethods().signInWithGoogle(context);
      // if(user != null) {
      Get.offAll(() => Home(),
          transition: Transition.leftToRightWithFade,
          duration: Duration(milliseconds: 500));
      // }
    } catch (_) {
      printError(info: "Error");
    } finally {
      isLoading.value = false;
    }
  }
}
