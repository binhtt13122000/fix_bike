import 'package:fix_bike/controller/OrderController.dart';
import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/screens/detail.dart';
import 'package:fix_bike/screens/user/RatingScreen.dart';
import 'package:fix_bike/services/database.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../MessageScreen.dart';

class MainModal extends StatelessWidget {
  final Function draw;
  final LatLng destination;
  final LatLng origin;
  final Function cancel;

  MainModal(
      {Key? key,
      required this.height,
      required this.draw,
      required this.destination,
      required this.origin,
      required this.cancel})
      : super(key: key);
  final double height;

  final statusAppController = Get.put(StatusAppController());

  showMoneyDialog(BuildContext context) {
    // show the dialog
    showGeneralDialog(
      barrierLabel: "showMoneyDialog",
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
            height: 500.0,
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Đơn giá",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tên Phụ kiện"),
                    Text("Đơn giá"),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Lưới tản nhiệt"),
                    Text("500.000 VNĐ"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cần sang số"),
                    Text("250.000 VNĐ"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Khác"),
                    Text("120.000 VNĐ"),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tổng phụ kiện"),
                    Text("750.000 VNĐ"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Công sửa"),
                    Text("300.000 VNĐ"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tiền xe kéo"),
                    Text("300.000 VNĐ"),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tổng tiền"),
                    Text("1.470.000 VNĐ"),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity,
                          40), // double.infinity is the width and 30 is the height
                      primary: Color(0xFFF9AA33),
                      onPrimary: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    showDialog(context);
                  },
                  child: Text('ĐỒNG Ý'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity,
                          40), // double.infinity is the width and 30 is the height
                      primary: Colors.red,
                      onPrimary: Colors.white),
                  onPressed: () {
                    // Navigator.of(context).pop();
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    DatabaseMethods().updateTodo(8);
                  },
                  child: Text('YÊU CẦU CẬP NHẬT ĐƠN GIÁ'),
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

  showCancelDialog(BuildContext context) {
    // show the dialog
    showGeneralDialog(
      barrierLabel: "showCancelDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        return Obx(() => Dialog(
              insetAnimationCurve: Curves.bounceOut,
              insetAnimationDuration: Duration(seconds: 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
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
                      "Bạn có chắc sẽ hủy đơn? Hãy nói lí do cho người sửa xe của bạn",
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
                    // Container(
                    //   padding: EdgeInsets.only(top: 8, bottom: 8),
                    //   child: RatingBar.builder(
                    //     initialRating: 1,
                    //     minRating: 1,
                    //     direction: Axis.horizontal,
                    //     allowHalfRating: true,
                    //     unratedColor: Colors.amber.withAlpha(50),
                    //     itemCount: 5,
                    //     itemSize: 20.0,
                    //     itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    //     itemBuilder: (context, _) => Icon(
                    //       Icons.star,
                    //       color: Colors.amber,
                    //     ),
                    //     onRatingUpdate: (rating) {},
                    //     updateOnDrag: true,
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    //FIX-1
                    DropdownButton(
                      hint: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text("Chọn lý do"),
                      ),
                      onChanged: (newValue) {
                        statusAppController.reason.value = newValue.toString();
                      },
                      value: statusAppController.reason.value.isEmpty
                          ? null
                          : statusAppController.reason.value,
                      isExpanded: true,
                      items: statusAppController.listReason.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              valueItem,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    statusAppController.reason.value == "Khác"
                        ? TextField()
                        : Container(),
                    //lí do:
                    //- Đã có một người sửa xe khác giúp đỡ
                    //- Đã có người nhà tới hỗ trợ
                    //- Đã tìm được một tiệm sửa xe gần đây
                    //- Khác
                    // nhấn khác -> Textfield()
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
                        DatabaseMethods().updateTodo(11);
                      },
                      child: Text('HỦY ĐƠN SỬA XE'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity,
                              40), // double.infinity is the width and 30 is the height
                          primary: Colors.red,
                          onPrimary: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text('HỦY THAO TÁC'),
                    )
                  ],
                ),
              ),
            ));
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

  showDialog(BuildContext context) {
    // show the dialog
    showGeneralDialog(
      barrierLabel: "showGenerlDialog",
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
                  "Bạn đã sửa xe thành công, vui lòng đánh giá tài xế!",
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
                    initialRating: 1,
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
                TextField(),
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
                    if (Get.put(OrderController()).singleOrderApp.status != 0) {
                      Navigator.of(context).pop(true);
                      DatabaseMethods().updateTodo(0);
                    }
                  },
                  child: Text('GỬI FEEDBACK VỀ TÀI XẾ'),
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

  showReasonCannotFix(BuildContext context) {
    // show the dialog
    showGeneralDialog(
      barrierLabel: "showGenerlDialog",
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
            height: 300.0,
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Xin lỗi xe của bạn không thể sửa!",
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
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 80,
                ),
                SizedBox(height: 20,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                          text: 'Lý do: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: "Xe không sửa được",
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                                SizedBox(height: 20,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity,
                          40), // double.infinity is the width and 30 is the height
                      primary: Color(0xFFF9AA33),
                      onPrimary: Colors.black),
                  onPressed: () {
                    if (Get.put(OrderController()).singleOrderApp.status != 0) {
                      Navigator.of(context).pop(true);
                      DatabaseMethods().updateTodo(0);
                    }
                  },
                  child: Text('QUAY LẠI MÀN HÌNH CHÍNH'),
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
    if (orderController.singleOrderApp.status == 2) {
      Future.delayed(Duration.zero, () => {showAlertDialog(context)});
    }
    if (orderController.singleOrderApp.status == 8) {
      Future.delayed(Duration.zero, () => {showDialog(context)});
    }
    if (orderController.singleOrderApp.status == 14) {
      Future.delayed(Duration.zero, () => {showReasonCannotFix(context)});
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
                      "Chuẩn bị",
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
                      "Đang đi",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Expanded(child: Divider()),
                Column(
                  children: [
                    orderController.singleOrderApp.status == 5
                        ? IconWidget(status: 5)
                        : orderController.singleOrderApp.status == 16
                            ? IconWidget(status: 16)
                            : IconWidget(status: 6),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Kiểm tra",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                Expanded(child: Divider()),
                if (orderController.singleOrderApp.status == 6) ...[
                  Column(
                    children: [
                      orderController.singleOrderApp.status == 16
                          ? IconWidget(status: 17)
                          : IconWidget(status: 7),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Đang sửa",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ],
                if (orderController.singleOrderApp.status != 6) ...[
                  Column(
                    children: [
                      orderController.singleOrderApp.status == 16
                          ? IconWidget(status: 17)
                          : IconWidget(status: 7),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Đang sửa",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ],
                Expanded(child: Divider()),
                Column(
                  children: [
                    orderController.singleOrderApp.status == 16
                        ? IconWidget(status: 17)
                        : IconWidget(status: 8),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Hoàn thành",
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
                          onTap: () => {Get.to(ViewRepairManScreen())},
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
                if (orderController.singleOrderApp.status == 10) ...[
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Feedback đã được gửi về cho tài xế!",
                          style: TextStyle(fontSize: 16),
                        ),
                        JumpingDotsProgressIndicator(
                          fontSize: 20.0,
                        ),
                      ],
                    ),
                  )
                ],
                // if (orderController.singleOrderApp.status == 14) ...[
                //   SizedBox(
                //     height: 20,
                //   ),
                //   showAlertDialog(context)
                // ],
                if (orderController.singleOrderApp.status == 4) ...[
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Người sửa xe đang trên đường đến",
                          style: TextStyle(fontSize: 16),
                        ),
                        JumpingDotsProgressIndicator(
                          fontSize: 20.0,
                        ),
                      ],
                    ),
                  )
                ],
                if (orderController.singleOrderApp.status == 5) ...[
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Đã đến và đang đánh giá tình trạng xe",
                          style: TextStyle(fontSize: 16),
                        ),
                        JumpingDotsProgressIndicator(
                          fontSize: 20.0,
                        ),
                      ],
                    ),
                  )
                ],
                if (orderController.singleOrderApp.status == 3) ...[
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40),
                        primary: Colors.red,
                        onPrimary: Colors.white),
                    onPressed: () {
                      showCancelDialog(context);
                    },
                    child: Text('HỦY ĐƠN'),
                  ),
                ],
                if (orderController.singleOrderApp.status == 7) ...[
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40),
                        primary: Colors.green[400],
                        onPrimary: Colors.white),
                    onPressed: () {
                      DatabaseMethods().updateTodo(8);
                    },
                    child: Text('XÁC NHẬN XE ĐÃ ĐƯỢC SỬA'),
                  ),
                ],
                if (orderController.singleOrderApp.status == 6) ...[
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      "Người sửa xe muốn đưa xe về tiệm. Bạn có đồng ý không?"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 40),
                              primary: Colors.green[400],
                              onPrimary: Colors.white),
                          onPressed: () {
                            DatabaseMethods().updateTodo(16);
                          },
                          child: Text('Đồng ý'),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 40),
                              primary: Colors.red[400],
                              onPrimary: Colors.white),
                          onPressed: () {
                            DatabaseMethods().updateTodo(15);
                          },
                          child: Text('Không đồng ý'),
                        ),
                      ),
                    ],
                  )
                ],
                if (orderController.singleOrderApp.status == 11) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SpinKitThreeInOut(
                        color: Color(0xFFF9AA33),
                        size: 50,
                      ),
                      Text(
                        "Đang chờ người sửa xe xác nhận lại!",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  )
                ],
                if (orderController.singleOrderApp.status == 16) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SpinKitThreeInOut(
                        color: Color(0xFFF9AA33),
                        size: 50,
                      ),
                      Text(
                        "Xe đang được đưa về tiệm!",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  )
                ],
                // if (orderController.singleOrderApp.status == 8) ...[
                //   SizedBox(
                //     height: 20,
                //   ),
                //   Center(
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Text(
                //           "Đang chờ người sửa xe nhập hóa đơn!",
                //           style: TextStyle(fontSize: 16),
                //         ),
                //         JumpingDotsProgressIndicator(
                //           fontSize: 20.0,
                //         ),
                //       ],
                //     ),
                //   )
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
    if (orderController.singleOrderApp.status == 11) {
      return Icon(
        Icons.watch_later_outlined,
        color: Colors.black,
      );
    }
    return orderController.singleOrderApp.status < status
        ? Icon(
            Icons.watch_later_outlined,
            color: Colors.black,
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
