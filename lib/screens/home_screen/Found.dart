import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:progress_indicators/progress_indicators.dart';

class Found extends GetWidget {
  final Function draw;
  final LatLng destination;
  final LatLng origin;
  final StatusAppController statusAppController =
      Get.put(StatusAppController());

  Found(
      {Key? key,
      required this.draw,
      required this.destination,
      required this.origin})
      : super(key: key);

  handleChangeScreen() {
    statusAppController.setStatus(3);
    draw(origin, destination);
  }

  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 5), handleChangeScreen);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Đang tìm người sửa xe',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            JumpingDotsProgressIndicator(
              fontSize: 20.0,
            ),
          ],
        )
      ],
    );
  }
}
