import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/screens/MessageScreen.dart';
import 'package:fix_bike/screens/repairman/update_purchase_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Found extends GetWidget {
  final LatLng destination;
  final LatLng origin;
  final StatusAppController statusAppController =
      Get.put(StatusAppController());

  Found({Key? key, required this.destination, required this.origin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Thông tin khách hàng",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: new TextSpan(
                style: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Tên1: ',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: "Nguyễn Văn A",
                  ),
                ],
              ),
            ),
            RichText(
              text: new TextSpan(
                style: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Thời gian dự kiến sẽ đến: ',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: '15 phút',
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
              child: Text("Cập nhật thanh toán"),
              onPressed: () => Get.to(UpdatePurchasePage()),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: Text("Nhắn tin"),
                onPressed: () {
                  Get.to(MessagePage());
                })
          ],
        )
      ],
    );
  }
}
