import 'package:fix_bike/controller/AddressController.dart';
import 'package:fix_bike/controller/OrderController.dart';
import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/screens/home_screen/UpdatePurchase.dart';
import 'package:fix_bike/screens/steps/bike_status.dart';
import 'package:fix_bike/services/database.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../MessageScreen.dart';

class MainModal2 extends StatelessWidget {
  final Function draw;
  final LatLng destination;
  final LatLng origin;

  const MainModal2(
      {Key? key,
      required this.height,
      required this.draw,
      required this.destination,
      required this.origin})
      : super(key: key);
  final double height;

  showAlertDialog(BuildContext context) {
    // show the dialog
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        Future.delayed(Duration(seconds: 30), () {
          Navigator.of(context).pop(true);
          draw(origin, destination);
          DatabaseMethods().updateTodo(3);
        });
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
            child: Column(
              children: [
                Text(
                  "Tìm thấy một người cần sửa xe ở gần đây!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(avatarGrab),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Trương Thanh Bình",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.room,
                      color: Colors.red[300],
                      size: 20,
                    ),
                    Text(
                      " Địa chỉ",
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  Get.put(AddressController()).address.value,
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.build,
                      color: Colors.grey,
                      size: 20,
                    ),
                    Text(
                      " Vấn đề",
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "- Xe không khởi động được",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    ),
                    Text(
                      "- Tôi bị tai nạn",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.photo_camera,
                      color: Colors.grey,
                      size: 20,
                    ),
                    Text(
                      " Hình ảnh",
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 7,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFFF9AA33),
                              onPrimary: Colors.black),
                          child: Text(
                            "Nhận đơn",
                            style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  // fontSize: 20,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                          onPressed: () {
                            DatabaseMethods().updateTodo(2);
                            Navigator.of(context).pop(true);
                          },
                        )),
                    Expanded(
                      flex: 1,
                      child: Text(""),
                    ),
                    Expanded(
                        flex: 4,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red, onPrimary: Colors.white),
                          child: Text(
                            "Hủy",
                            style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  // fontSize: 20,
                                  color: Colors.black,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                          onPressed: () {
                            DatabaseMethods().updateTodo(0);
                            Navigator.of(context).pop(true);
                          },
                        )),
                  ],
                )
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final StatusAppController statusAppController =
        Get.put(StatusAppController());
    OrderController orderController = Get.find();
    // if (orderController.singleOrderApp.status == 2) {
    //   draw(origin, destination);
    // }
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconWidget(status: 3),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Đang đến",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    )
                  ],
                ),
                Expanded(child: Divider()),
                Column(
                  children: [
                    IconWidget(status: 4),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Đã đến",
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    )
                  ],
                ),
                Expanded(child: Divider()),
                Column(
                  children: [
                    IconWidget(status: 5),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Đã sửa",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        )),
                  ],
                ),
                Expanded(child: Divider()),
                Column(
                  children: [
                    IconWidget(status: 6),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Đã thanh toán",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Trương Thanh Bình",
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                                Text(
                                  "Dự kiến tới: 15 phút",
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.login,
                            color: Colors.green[400],
                          ),
                          onTap: () => {},
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.phone,
                            color: Colors.green[400],
                          ),
                          onTap: () => {},
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        GestureDetector(
                          child: Icon(Icons.chat_outlined,
                              color: Color(0xFFF9AA33)),
                          onTap: () => {Get.to(MessagePage())},
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                if (orderController.singleOrderApp.status == 3) ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40),
                        // double.infinity is the width and 30 is the height
                        primary: Color(0xFFF9AA33),
                        onPrimary: Colors.black),
                    onPressed: () {
                      DatabaseMethods().updateTodo(4);
                    },
                    child: Text(
                      'XÁC NHẬN ĐÃ ĐẾN',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            // fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                ],
                if (orderController.singleOrderApp.status == 4) ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40),
                        // double.infinity is the width and 30 is the height
                        primary: Color(0xFFF9AA33),
                        onPrimary: Colors.black),
                    onPressed: () {
                      DatabaseMethods().updateTodo(5);
                    },
                    child: Text('XÁC NHẬN ĐÃ SỬA',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              // fontSize: 14,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        )),
                  ),
                ],
                if (orderController.singleOrderApp.status == 5) ...[
                  Obx(() => statusAppController.isUpdatePurchase.value
                      ? Text(
                          "Tổng hóa đơn: " +
                              statusAppController.totalPrice.value
                                  .toStringAsFixed(0) +
                              "vnđ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )
                      : Container()),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40),
                        // double.infinity is the width and 30 is the height
                        primary: Color(0xFFF9AA33),
                        onPrimary: Colors.black),
                    onPressed: () {
                      statusAppController.isUpdatePurchase.value
                          ? {
                              statusAppController.setTotalPrice(0),
                              statusAppController.setUpdatePurchase(false),
                              DatabaseMethods().updateTodo(6),
                            }
                          : Get.to(
                              UpdatePurchaseScreen(),
                              transition: Transition.rightToLeftWithFade,
                              duration: Duration(milliseconds: 600),
                            );
                    },
                    child: Obx(() => statusAppController.isUpdatePurchase.value
                        ? Text('XÁC NHẬN ĐÃ THANH TOÁN')
                        : Text('CẬP NHẬT THANH TOÁN')),
                  ),
                ],
                // Row(
                //   children: [
                //     Expanded(
                //       child: Container(
                //         height: 40,
                //         child: Focus(
                //             onFocusChange: (hasFocus) {
                //               if (hasFocus) {
                //                 Get.to(MessagePage(),
                //                     duration: Duration(microseconds: 500),
                //                     transition: Transition.downToUp);
                //               }
                //             },
                //             child: TextField(
                //               decoration: new InputDecoration(
                //                 border: new OutlineInputBorder(
                //                     borderSide:
                //                         new BorderSide(color: Colors.teal)),
                //                 labelText: 'Chat với người sửa xe ',
                //                 prefixIcon: const Icon(
                //                   Icons.chat_outlined,
                //                   color: Color(0xFFF9AA33),
                //                 ),
                //               ),
                //             )),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Container(
                //       width: 40,
                //       height: 40,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(3),
                //           border: Border.all(color: Colors.black45)),
                //       child: Icon(
                //         Icons.phone,
                //         color: Colors.black,
                //       ),
                //     )
                //   ],
                // )
                if (height > 300) ...[HideData()]
              ],
            ),
          )
        ],
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({Key? key, required this.status}) : super(key: key);
  final int status;

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find();
    return orderController.singleOrderApp.status < status
        ? Icon(
            Icons.cancel,
            color: Colors.red,
          )
        : (orderController.singleOrderApp.status > status)
            ? Icon(
                Icons.check_circle,
                color: Colors.green[600],
              )
            : (Icon(
                Icons.pending,
                color: Color(0xFFF9AA33),
              ));
  }
}

class HideData extends StatelessWidget {
  const HideData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [Divider(), Text("Tình trạng xe")],
      ),
    );
  }
}
