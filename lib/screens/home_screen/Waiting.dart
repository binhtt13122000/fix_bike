import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WaitingModal extends StatelessWidget {
  const WaitingModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitThreeInOut(
              color: Color(0xFFF9AA33),
              size: 50,
            ),
            Text(
              "Đang tìm người sửa xe cho bạn!",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
