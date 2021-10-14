import 'package:fix_bike/controller/AddressController.dart';
import 'package:fix_bike/controller/OrderController.dart';
import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/services/database.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../MessageScreen.dart';

class MainModal extends StatelessWidget {
  final Function draw;
  final LatLng destination;
  final LatLng origin;

  MainModal(
      {Key? key,
      required this.height,
      required this.draw,
      required this.destination,
      required this.origin})
      : super(key: key);
  final double height;
  final OrderController orderController = Get.find();
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
                        decoration: TextDecoration.none
                        // color: Color(0xFF00B242)
                        ),
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
                      // color: Color(0xFF00B242)
                    ),
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
                            decoration: TextDecoration.none
                            // color: Color(0xFF00B242)
                            ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(Get.put(AddressController()).address.value,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        decoration: TextDecoration.none)),
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
                            decoration: TextDecoration.none
                            // color: Color(0xFF00B242)
                            ),
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
                            decoration: TextDecoration.none
                            // color: Color(0xFF00B242)
                            ),
                      ),
                    ),
                    Text(
                      "- Tôi bị tai nạn",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none
                            // color: Color(0xFF00B242)
                            ),
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
                            decoration: TextDecoration.none
                            // color: Color(0xFF00B242)
                            ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.grey,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.25,
                        child: orderController.singleOrderApp.image1 == ''
                            ? Image(
                                image: AssetImage(bike_1),
                                fit: BoxFit.fill,
                              )
                            : Image.network(
                                orderController.singleOrderApp.image1,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.grey,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.25,
                        child: orderController.singleOrderApp.image2 == ''
                            ? Image(
                                image: AssetImage(bike_2),
                                fit: BoxFit.fill,
                              )
                            : Image.network(
                                orderController.singleOrderApp.image2,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.grey,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.25,
                        child: orderController.singleOrderApp.image3 == ''
                            ? Icon(Icons.camera_alt_outlined,
                                size: 18, color: Colors.white)
                            : Image.network(
                                orderController.singleOrderApp.image3,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
                                  fontSize: 16,
                                  color: Colors.black,
                                  decoration: TextDecoration.none
                                  // color: Color(0xFF00B242)
                                  ),
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
                                  fontSize: 16,
                                  color: Colors.black,
                                  decoration: TextDecoration.none
                                  // color: Color(0xFF00B242)
                                  ),
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
    OrderController orderController = Get.find();
    if (orderController.singleOrderApp.status == 1) {
      Future.delayed(Duration.zero, () => {showAlertDialog(context)});
    }
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
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            decoration: TextDecoration.none
                            // color: Color(0xFF00B242)
                            ),
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
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            decoration: TextDecoration.none
                            // color: Color(0xFF00B242)
                            ),
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
                    Text(
                      "Đã sửa",
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            decoration: TextDecoration.none
                            // color: Color(0xFF00B242)
                            ),
                      ),
                    )
                  ],
                ),
                Expanded(child: Divider()),
                Column(
                  children: [
                    IconWidget(status: 6),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Đã thanh toán",
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.none
                            // color: Color(0xFF00B242)
                            ),
                      ),
                    )
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
                            Row(
                              children: [
                                Text(
                                  "Lê Trọng Nhân",
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        decoration: TextDecoration.none
                                        // color: Color(0xFF00B242)
                                        ),
                                  ),
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
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0),
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
