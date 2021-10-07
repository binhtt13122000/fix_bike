import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:progress_indicators/progress_indicators.dart';

class Found extends GetWidget {
  final Function draw;
  final LatLng destination;
  final LatLng origin;
  final StatusAppController statusAppController =
      Get.put(StatusAppController());
  double _initialRating = 4.5;
  bool _isVertical = false;
  IconData? _selectedIcon;

  Found(
      {Key? key,
      required this.draw,
      required this.destination,
      required this.origin})
      : super(key: key);

  handleChangeScreen(BuildContext context) {
    Navigator.pop(context);
    statusAppController.setStatus(3);
    draw(origin, destination);
  }

  showAlertDialog(BuildContext context) {
    statusAppController.setFinding(false);
    // show the dialog
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, _, __) {
        new Future.delayed(
            const Duration(seconds: 5), () => handleChangeScreen(context));
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
                    initialRating: _initialRating,
                    minRating: 1,
                    direction: _isVertical ? Axis.vertical : Axis.horizontal,
                    allowHalfRating: true,
                    unratedColor: Colors.amber.withAlpha(50),
                    itemCount: 5,
                    itemSize: 20.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Icon(
                      _selectedIcon ?? Icons.star,
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
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     new Future.delayed(
    //         const Duration(seconds: 4), () => handleChangeScreen(context));
    //     return Dialog(
    //       insetAnimationCurve: Curves.bounceOut,
    //       insetAnimationDuration: Duration(seconds: 1),
    //       shape:
    //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    //       child: Container(
    //         height: 300.0,
    //         padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Text(
    //               "Yeah!Đã tìm được một người sửa xe cho bạn",
    //               softWrap: true,
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   fontSize: 18,
    //                   color: Colors.black,
    //                   fontWeight: FontWeight.w500),
    //             ),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             Container(
    //               width: 130,
    //               height: 130,
    //               decoration: BoxDecoration(
    //                   border: Border.all(
    //                       width: 4,
    //                       color: Theme.of(context).scaffoldBackgroundColor),
    //                   boxShadow: [
    //                     BoxShadow(
    //                         spreadRadius: 2,
    //                         blurRadius: 10,
    //                         color: Colors.black.withOpacity(0.1),
    //                         offset: Offset(0, 10))
    //                   ],
    //                   shape: BoxShape.circle,
    //                   image: DecorationImage(
    //                     fit: BoxFit.cover,
    //                     image: AssetImage(avatarGrab),
    //                   )),
    //             ),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             Text(
    //               "Đỗ Nguyễn Vi Đặng",
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                 fontSize: 17,
    //                 fontWeight: FontWeight.w400,
    //               ),
    //             ),
    //             Container(
    //               padding: EdgeInsets.only(top: 8, bottom: 8),
    //               child: RatingBar.builder(
    //                 initialRating: _initialRating,
    //                 minRating: 1,
    //                 direction: _isVertical ? Axis.vertical : Axis.horizontal,
    //                 allowHalfRating: true,
    //                 unratedColor: Colors.amber.withAlpha(50),
    //                 itemCount: 5,
    //                 itemSize: 20.0,
    //                 itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
    //                 itemBuilder: (context, _) => Icon(
    //                   _selectedIcon ?? Icons.star,
    //                   color: Colors.amber,
    //                 ),
    //                 onRatingUpdate: (rating) {},
    //                 updateOnDrag: true,
    //               ),
    //             ),
    //             Text(
    //               "54F5-2185•Honda-AirBlade",
    //               style: TextStyle(
    //                 fontSize: 15,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    statusAppController.setFinding(true);
    new Future.delayed(
        const Duration(seconds: 5), () => showAlertDialog(context));
    return Obx(
      () => statusAppController.isFinding.value
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Đang tìm người sửa xe',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    JumpingDotsProgressIndicator(
                      fontSize: 20.0,
                    ),
                  ],
                ),
              ],
            )
          : Container(),
    );
  }
}
