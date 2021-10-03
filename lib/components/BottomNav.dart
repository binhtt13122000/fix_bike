import 'package:fix_bike/controller/PagingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PagingController pagingController = Get.put(PagingController());
    return Obx(() => BottomNavigationBar(
          selectedItemColor: Color(0xFFF9AA33),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity_outlined),
              label: 'Thông tin',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none_outlined),
              label: 'Thông báo',
            ),
          ],
          currentIndex: pagingController.currentIndex.value,
          onTap: pagingController.onChangeRoute,
        ));
  }
}
