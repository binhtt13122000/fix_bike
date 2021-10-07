import 'package:fix_bike/controller/OrderController.dart';
import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/services/database.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../MessageScreen.dart';

class MainModal extends StatelessWidget {
  final Function draw;
  final LatLng destination;
  final LatLng origin;

  const MainModal(
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
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        Future.delayed(Duration(seconds: 5), () {
          Navigator.of(context).pop(true);
          draw(origin, destination);
          DatabaseMethods().updateTodo(3);
        });
        return Dialog(
          insetAnimationCurve: Curves.bounceOut,
          insetAnimationDuration: Duration(seconds: 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            height: 400.0,
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Yeah! Đã tìm được người sửa xe cho bạn!",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
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
                  height: 10,
                ),
                Text(
                  "Lê Trọng Nhân",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: RatingBar.builder(
                    initialRating: 5,
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
                  "Thân thiện, chuyên nghiệp, nhanh chóng",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
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

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find();
    if (orderController.singleOrderApp.status == 2) {
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
                      style: TextStyle(fontSize: 12),
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
                      style: TextStyle(fontSize: 12),
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
                      style: TextStyle(fontSize: 12),
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
                      style: TextStyle(fontSize: 12),
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
                                  style: TextStyle(fontSize: 14),
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
                if (height > 350) ...[HideData()]
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
        children: [
          Divider(),
          Text(
            "Tình trạng xe",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Chi tiết: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                  child: Text(
                    'Không khởi động được',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'Tôi bị tai nạn',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                // Container(
                //   // height: 180,
                //   // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //   // decoration: BoxDecoration(
                //   //   color: Colors.white,
                //   // ),

                //   child: TextFormField(
                //     textAlignVertical: TextAlignVertical.center,
                //     initialValue: "Không khởi động được\nTôi bị tai nạn",
                //     maxLines: null,
                //     // keyboardType: TextInputType.multiline,
                //     style: TextStyle(
                //       fontSize: 16,
                //     ),
                //     // decoration: InputDecoration(
                //     //   labelStyle: TextStyle(
                //     //       fontSize: 18,
                //     //       fontWeight: FontWeight.w500,
                //     //       color: Colors.black),
                //     //   border: InputBorder.none,
                //     //   filled: true,
                //     //   fillColor: Colors.white,
                //     // ),
                //   ),
                // ),
                Text(
                  'Hình ảnh: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    // Image: (Image(image: ))
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                //   child: ,
                // ),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Image(
                      image: AssetImage(bike_1),
                      width: 70,
                      height: 70,
                    ),
                  ),
                  Image(
                    image: AssetImage(bike_2),
                    width: 60,
                    height: 60,
                  ),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
