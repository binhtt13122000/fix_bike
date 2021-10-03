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
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.directions_car,
                          color: Colors.grey.shade500,
                          size: 35,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Vinfast LUX A2.0",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    Text(
                      "30A - 128.93",
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity,
                  40), // double.infinity is the width and 30 is the height
              primary: Color(0xFFF9AA33),
              onPrimary: Colors.black),
          onPressed: () {
            Get.to(StepOneScreen(),
                duration: Duration(microseconds: 500),
                transition: Transition.upToDown);
          },
          child: Text('TÌM NGƯỜI SỬA XE'),
        )
      ],
    );
  }
}
