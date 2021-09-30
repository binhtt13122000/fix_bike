import 'package:fix_bike/controller/AddressController.dart';
import 'package:fix_bike/screens/steps/step_one_screen.dart';
import 'package:fix_bike/screens/user/BikeStatusScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Normal extends StatelessWidget {
  Normal({Key? key}) : super(key: key);
  final AddressController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  text: 'Địa Chỉ: ',
                  style: new TextStyle(fontWeight: FontWeight.bold)),
              new TextSpan(
                text: '${c.address}',
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
              child: Text("Tìm kiếm người sửa xe"),
              onPressed: () {
                Get.to(() => StepOneScreen(),
                    transition: Transition.rightToLeftWithFade,
                    duration: Duration(milliseconds: 500));
              },
            )
          ],
        )
      ],
    );
  }
}
