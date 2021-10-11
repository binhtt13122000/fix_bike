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

class MainHome extends StatelessWidget {
  final Function draw;
  final LatLng destination;
  final LatLng origin;

  const MainHome(
      {Key? key,
      required this.height,
      required this.draw,
      required this.destination,
      required this.origin})
      : super(key: key);
  final double height;

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
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.date_range,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "130.000 VNĐ/Ngày",
                      style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.white)),
                    )
                  ],
                ),
                // Expanded(child: Divider()),
                Column(
                  children: [
                    Icon(
                      Icons.calendar_view_month,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "4 tr VNĐ/tháng",
                      style: GoogleFonts.lato(
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.white)),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            // color: Color(0xFF0F1013),
            // padding: EdgeInsets.all(14),
            height: 170,
            width: 330,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF0F1013)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: Text(
                    "SosCar",
                    // style: TextStyle(
                    //     fontSize: 30,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.white),
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        // Container(
                        //   width: 40,
                        //   height: 100,
                        //   decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       image: DecorationImage(
                        //         fit: BoxFit.cover,
                        //         image: AssetImage(avatarGrab),
                        //       )),
                        // ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 13, 0),
                          child: Column(
                            children: [
                              Icon(Icons.verified_outlined,
                                  size: 40,
                                  color: Colors.lightGreenAccent[400]),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "100%",
                                style: TextStyle(
                                    fontSize: 26, color: Color(0xFF00B242)),
                              ),
                              Text(
                                "Chấp nhận",
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 14, color: Colors.white54)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.star_rate,
                                size: 40,
                                color: Colors.yellow,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "5.00",
                                style: TextStyle(
                                    fontSize: 26, color: Color(0xFF00B242)),
                              ),
                              Text(
                                "Đánh giá",
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 14, color: Colors.white54)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(13, 0, 5, 0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.cancel_outlined,
                                size: 40,
                                color: Colors.red,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "0.0 %",
                                style: TextStyle(
                                    fontSize: 26, color: Color(0xFF00B242)),
                              ),
                              Text(
                                "Hủy chuyến",
                                style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        fontSize: 14, color: Colors.white54)),
                              )
                            ],
                          ),
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           "Trương Thanh Bình",
                        //           style: TextStyle(fontSize: 14),
                        //         ),
                        //         Text(
                        //           "Dự kiến tới: 15 phút",
                        //           style: TextStyle(fontSize: 14),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     GestureDetector(
                    //       child: Icon(
                    //         Icons.login,
                    //         color: Colors.green[400],
                    //       ),
                    //       onTap: () => {},
                    //     ),
                    //     SizedBox(
                    //       width: 12,
                    //     ),
                    //     GestureDetector(
                    //       child: Icon(
                    //         Icons.phone,
                    //         color: Colors.green[400],
                    //       ),
                    //       onTap: () => {},
                    //     ),
                    //     SizedBox(
                    //       width: 12,
                    //     ),
                    //     GestureDetector(
                    //       child: Icon(Icons.chat_outlined,
                    //           color: Color(0xFFF9AA33)),
                    //       onTap: () => {Get.to(MessagePage())},
                    //     ),
                    //   ],
                    // )
                  ],
                ),
                // SizedBox(
                //   height: 30,
                // ),
                // if (orderController.singleOrderApp.status == 3) ...[
                //   ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //         minimumSize: Size(double.infinity, 40),
                //         // double.infinity is the width and 30 is the height
                //         primary: Color(0xFFF9AA33),
                //         onPrimary: Colors.black),
                //     onPressed: () {
                //       DatabaseMethods().updateTodo(4);
                //     },
                //     child: Text('XÁC NHẬN ĐÃ ĐẾN'),
                //   ),
                // ],
                // if (orderController.singleOrderApp.status == 4) ...[
                //   ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //         minimumSize: Size(double.infinity, 40),
                //         // double.infinity is the width and 30 is the height
                //         primary: Color(0xFFF9AA33),
                //         onPrimary: Colors.black),
                //     onPressed: () {
                //       DatabaseMethods().updateTodo(5);
                //     },
                //     child: Text('XÁC NHẬN ĐÃ SỬA'),
                //   ),
                // ],
                // if (orderController.singleOrderApp.status == 5) ...[
                //   Obx(() => statusAppController.isUpdatePurchase.value
                //       ? Text(
                //           "Tổng hóa đơn: " +
                //               statusAppController.totalPrice.value
                //                   .toStringAsFixed(0) +
                //               "vnđ",
                //           style: TextStyle(
                //               fontSize: 16, fontWeight: FontWeight.w500),
                //         )
                //       : Container()),
                //   SizedBox(
                //     height: 10,
                //   ),
                //   ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //         minimumSize: Size(double.infinity, 40),
                //         // double.infinity is the width and 30 is the height
                //         primary: Color(0xFFF9AA33),
                //         onPrimary: Colors.black),
                //     onPressed: () {
                //       statusAppController.isUpdatePurchase.value
                //           ? {
                //               statusAppController.setTotalPrice(0),
                //               statusAppController.setUpdatePurchase(false),
                //               DatabaseMethods().updateTodo(6),
                //             }
                //           : Get.to(
                //               UpdatePurchaseScreen(),
                //               transition: Transition.rightToLeftWithFade,
                //               duration: Duration(milliseconds: 600),
                //             );
                //     },
                //     child: Obx(() => statusAppController.isUpdatePurchase.value
                //         ? Text('XÁC NHẬN ĐÃ THANH TOÁN')
                //         : Text('CẬP NHẬT THANH TOÁN')),
                //   ),
                // ],
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
                // if (height > 300) ...[HideData()]
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
