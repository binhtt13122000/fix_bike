import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/screens/MessageScreen.dart';
import 'package:fix_bike/screens/user/RatingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Fixed extends GetWidget {
  final String money;
  final Function cancel;
  final StatusAppController statusAppController =
  Get.put(StatusAppController());

  Fixed({Key? key, this.money = "", required this.cancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Đã sửa xe và thanh toán thành công!",
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
                  text: 'Số tiền phải trả: ',
                  style: new TextStyle(fontWeight: FontWeight.bold)),
              new TextSpan(
                text: '$money VND',
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
              child: Text("Xác nhận"),
              onPressed: () {
                statusAppController.setStatus(1);
                cancel();
              },
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: Text("Phản hồi"),
                onPressed: () {
                  Get.to(RatingPage());
                })
          ],
        )
      ],
    );
  }
}