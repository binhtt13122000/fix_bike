import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/screens/MessageScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Thông tin khách hàng",
              textAlign: TextAlign.center,
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
                      text: 'Tên: ',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  new TextSpan(
                    text: "Nguyễn Văn A",
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
                    text: '15 phút',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: Text("Nhắn tin"),
                  onPressed: () => Get.to(MessagePage()),
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
        )
      ],
    );
  }
}
