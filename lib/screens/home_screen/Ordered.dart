import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/screens/MessageScreen.dart';
import 'package:fix_bike/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ordered extends StatelessWidget {
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
        Text(
          "Thông tin khách hàng",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
                text: 'Nguyễn Văn A',
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
                  text: 'Số tiền: ',
                  style: new TextStyle(fontWeight: FontWeight.bold)),
              new TextSpan(
                text: '150.000 VNĐ',
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: Text("Đã sửa"),
                onPressed: () {
                  statusAppController.setStatus(1);
                  Get.to(Home());
                })
          ],
        )
      ],
    );
  }
}
