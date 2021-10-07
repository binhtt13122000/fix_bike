import 'package:fix_bike/controller/AddressController.dart';
import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/screens/MessageScreen.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:fa_stepper/fa_stepper.dart';

class Ordered extends GetWidget {
  final int minutes;
  final String name;
  final Function cancel;
  final StatusAppController statusAppController =
      Get.put(StatusAppController());

  final AddressController addressController = Get.find();
  Ordered({Key? key, this.minutes = 0, this.name = "", required this.cancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Người sửa xe sắp đến (15:00 phút)",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(avatarGrab),
                      )),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Lê Trọng Nhân",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Container(
                      child: RatingBar.builder(
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        unratedColor: Colors.amber.withAlpha(50),
                        itemCount: 5,
                        itemSize: 16.0,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                        updateOnDrag: true,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Icon(
              Icons.login,
              color: Colors.green[400],
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                child: Focus(
                    onFocusChange: (hasFocus) {
                      if (hasFocus) {
                        Get.to(MessagePage(),
                            duration: Duration(microseconds: 500),
                            transition: Transition.downToUp);
                      }
                    },
                    child: TextField(
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                        labelText: 'Chat với người sửa xe ',
                        prefixIcon: const Icon(
                          Icons.chat_outlined,
                          color: Color(0xFFF9AA33),
                        ),
                      ),
                    )),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Colors.black45)),
              child: Icon(
                Icons.phone,
                color: Colors.black,
              ),
            )
          ],
        )
      ],
    );
  }
}
