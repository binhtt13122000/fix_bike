import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Found extends GetWidget {
  final int minutes;
  final String name;
  final Function draw;
  final LatLng destination;
  final LatLng origin;
  final StatusAppController statusAppController =
      Get.put(StatusAppController());

  Found(
      {Key? key,
      this.minutes = 0,
      this.name = "",
      required this.draw,
      required this.destination,
      required this.origin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: new TextSpan(
            // Note: Styles for TextSpans must be explicitly defined.
            // Child text spans will inherit styles from parent
            style: new TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              new TextSpan(
                  text: 'Tên: ',
                  style: new TextStyle(fontWeight: FontWeight.bold)),
              new TextSpan(
                text: name,
              ),
            ],
          ),
        ),
        RichText(
          text: new TextSpan(
            // Note: Styles for TextSpans must be explicitly defined.
            // Child text spans will inherit styles from parent
            style: new TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
              new TextSpan(
                  text: 'Thời gian dự kiến sẽ đến: ',
                  style: new TextStyle(fontWeight: FontWeight.bold)),
              new TextSpan(
                text: '$minutes phút',
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // ElevatedButton(
            //   child: Text("Tìm đường"),
            //   onPressed: () => drawLine(
            //       addressController.origin.value.position,
            //       destination.position),
            // ),
            ElevatedButton(
              child: Text("Xác nhận sửa xe"),
              onPressed: () {
                statusAppController.setStatus(3);
                draw(origin, destination);
              },
            )
          ],
        )
      ],
    );
  }
}
