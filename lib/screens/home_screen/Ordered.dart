import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/screens/MessageScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ordered extends GetWidget {
  final int minutes;
  final String name;
  final Function cancel;
  final StatusAppController statusAppController =
      Get.put(StatusAppController());

  Ordered({Key? key, this.minutes = 0, this.name = "", required this.cancel})
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
                child: Text("Hủy"),
                onPressed: () {
                  statusAppController.setStatus(1);
                  cancel();
                })
          ],
        )
      ],
    );
  }
}
