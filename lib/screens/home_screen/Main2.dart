import 'package:fix_bike/controller/AddressController.dart';
import 'package:fix_bike/controller/OrderController.dart';
import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/screens/home_screen/UpdatePurchase.dart';
import 'package:fix_bike/screens/steps/bike_status.dart';
import 'package:fix_bike/services/database.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:progress_indicators/progress_indicators.dart';
import 'package:progress_indicators/src/jumping_dots.dart';

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

  showSuccessDialog(BuildContext context) {
    // show the dialog
    showGeneralDialog(
      barrierLabel: "showSuccessDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Dialog(
          insetAnimationCurve: Curves.bounceOut,
          insetAnimationDuration: Duration(seconds: 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            height: 600.0,
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Bạn đã được thanh toán",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      wordSpacing: 0.5,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 130,
                  height: 130,
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 100,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Trương Thanh Bình",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: RatingBar.builder(
                    initialRating: 4.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    unratedColor: Colors.amber.withAlpha(50),
                    itemCount: 5,
                    itemSize: 20.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                    updateOnDrag: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Được thanh toán: 970.000 VNĐ",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Feedback: Sửa xe nhanh, nhiệt tình",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity,
                          40), // double.infinity is the width and 30 is the height
                      primary: Color(0xFFF9AA33),
                      onPrimary: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    DatabaseMethods().updateTodo(0);
                  },
                  child: Text('ĐỒNG Ý'),
                ),
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

  // showFailDialog(BuildContext context) {
  //   // show the dialog
  //   showGeneralDialog(
  //     barrierLabel: "showSuccessDialog",
  //     barrierDismissible: true,
  //     barrierColor: Colors.black.withOpacity(0.6),
  //     transitionDuration: const Duration(milliseconds: 400),
  //     context: context,
  //     pageBuilder: (context, _, __) {
  //       return Dialog(
  //         insetAnimationCurve: Curves.bounceOut,
  //         insetAnimationDuration: Duration(seconds: 1),
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  //         child: Container(
  //           height: 600.0,
  //           padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               SizedBox(
  //                 height: 30,
  //               ),
  //               Text(
  //                 "Chúc mừng bạn đã sửa xe thành công",
  //                 softWrap: true,
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                     fontSize: 18,
  //                     color: Colors.black,
  //                     wordSpacing: 0.5,
  //                     fontWeight: FontWeight.w500),
  //               ),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               Container(
  //                 width: 130,
  //                 height: 130,
  //                child: Icon(
  //                   Icons.check_circle,
  //                   color: Colors.green,
  //                   size: 100),
  //               ),
  //               SizedBox(
  //                 height: 10,
  //               ),
  //               Text(
  //                 "Trương Thanh Bình",
  //                 textAlign: TextAlign.center,
  //                 style: TextStyle(
  //                   fontSize: 17,
  //                   fontWeight: FontWeight.w400,
  //                 ),
  //               ),
  //               Container(
  //                 padding: EdgeInsets.only(top: 8, bottom: 8),
  //                 child: RatingBar.builder(
  //                   initialRating: 1,
  //                   minRating: 1,
  //                   direction: Axis.horizontal,
  //                   allowHalfRating: true,
  //                   unratedColor: Colors.amber.withAlpha(50),
  //                   itemCount: 5,
  //                   itemSize: 20.0,
  //                   itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
  //                   itemBuilder: (context, _) => Icon(
  //                     Icons.star,
  //                     color: Colors.amber,
  //                   ),
  //                   onRatingUpdate: (rating) {},
  //                   updateOnDrag: true,
  //                 ),
  //               ),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               TextField(),
  //               SizedBox(
  //                 height: 20,
  //               ),
  //               ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                     minimumSize: Size(double.infinity,
  //                         40), // double.infinity is the width and 30 is the height
  //                     primary: Color(0xFFF9AA33),
  //                     onPrimary: Colors.black),
  //                 onPressed: () {
  //                   Navigator.of(context).pop(true);
  //                   DatabaseMethods().updateTodo(0);
  //                 },
  //                 child: Text('ĐỒNG Ý'),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //     transitionBuilder: (_, animation1, __, child) {
  //       return SlideTransition(
  //         position: Tween(
  //           begin: const Offset(0, 1),
  //           end: const Offset(0, 0),
  //         ).animate(animation1),
  //         child: child,
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final StatusAppController statusAppController =
        Get.put(StatusAppController());
    OrderController orderController = Get.find();
    // if (orderController.singleOrderApp.status == 2) {
    //   draw(origin, destination);
    // }
    if (orderController.singleOrderApp.status == 10) {
      Future.delayed(Duration.zero, () => {showSuccessDialog(context)});
    }
    // if (orderController.singleOrderApp.status == 11) {
    //   Future.delayed(Duration.zero, () => {showFailDialog(context)});
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
                      "Chuẩn bị",
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
                      "Đang đi",
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
                    Text("Đánh giá",
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
                    Text("Đang sửa",
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
                    orderController.singleOrderApp.status < 8
                        ? (Icon(
                            Icons.watch_later,
                            color: Colors.red,
                          ))
                        : (Icon(
                            Icons.pending,
                            color: Color(0xFFF9AA33),
                          )),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Thanh toán",
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
                      'BẮT ĐẦU DI CHUYỂN',
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
                    child: Text('ĐÃ ĐẾN',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              // fontSize: 14,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        )),
                  ),
                ],
                if (orderController.singleOrderApp.status == 5) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 170,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 40),
                              // double.infinity is the width and 30 is the height
                              primary: Color(0xFFF9AA33),
                              onPrimary: Colors.black),
                          onPressed: () {
                            statusAppController.bringCar.value = false;
                            DatabaseMethods().updateTodo(6);
                          },
                          child: Text('BẮT ĐẦU SỬA XE',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    // fontSize: 14,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              )),
                        ),
                      ),

                      Container(
                        width: 170,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 40),
                              // double.infinity is the width and 30 is the height
                              primary: Colors.blue, //Color(0xFFF9AA33),
                              onPrimary: Colors.black),
                          onPressed: () {
                            statusAppController.bringCar.value = true;
                            DatabaseMethods().updateTodo(7);
                          },
                          child: Text('ĐƯA XE VỀ TIỆM SỬA',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    // fontSize: 14,
                                    color: Colors.black,
                                    decoration: TextDecoration.none),
                              )),
                        ),
                      ),
                      // ),
                    ],
                  ),
                ],
                if (orderController.singleOrderApp.status == 6 ||
                    orderController.singleOrderApp.status == 7) ...[
                  SpinKitThreeInOut(
                    color: Color(0xFFF9AA33),
                    size: 50,
                  ),
                  Center(
                    child: Text(
                      "Các bước sửa xe đang được thực hiện!",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                  // Center(child: Text("CÁC BƯỚC SỬA XE ĐANG ĐƯỢC THỰC HIỆN")),
                  // JumpingDotsProgressIndicator(
                  //   fontSize: 30.0,
                  // ),
                  // Obx(() => statusAppController.isUpdatePurchase.value
                  //     ? Text(
                  //         "Tổng hóa đơn: " +
                  //             statusAppController.totalPrice.value
                  //                 .toStringAsFixed(0) +
                  //             "vnđ",
                  //         style: TextStyle(
                  //             fontSize: 16, fontWeight: FontWeight.w500),
                  //       )
                  //     : Container()),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //       minimumSize: Size(double.infinity, 40),
                  //       // double.infinity is the width and 30 is the height
                  //       primary: Color(0xFFF9AA33),
                  //       onPrimary: Colors.black),
                  //   onPressed: () {
                  //     statusAppController.isUpdatePurchase.value
                  //         ? {
                  //             statusAppController.setTotalPrice(0),
                  //             statusAppController.setUpdatePurchase(false),
                  //             DatabaseMethods().updateTodo(6),
                  //           }
                  //         : Get.to(
                  //             UpdatePurchaseScreen(),
                  //             transition: Transition.rightToLeftWithFade,
                  //             duration: Duration(milliseconds: 600),
                  //           );
                  //   },
                  //   child: Text('XE ĐANG SỬA'),
                  // ),
                ],
                if (orderController.singleOrderApp.status == 8) ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40),
                        // double.infinity is the width and 30 is the height
                        primary: Color(0xFFF9AA33),
                        onPrimary: Colors.black),
                    onPressed: () {
                      Get.to(UpdatePurchaseScreen(),
                          transition: Transition.rightToLeftWithFade,
                          duration: Duration(milliseconds: 600));
                    },
                    child: Text('CẬP NHẬP THANH TOÁN'),
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
            Icons.watch_later,
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
