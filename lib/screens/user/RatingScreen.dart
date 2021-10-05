import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double _initialRating = 2.0;
  bool _isVertical = false;

  IconData? _selectedIcon;

  @override
  Widget build(BuildContext context) {
    StatusAppController controller = Get.put(StatusAppController());
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: Color(0xFFF9AA33),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5),
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(avatar),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 250),
                      child: Text(
                        "Lê Trọng Nhân",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Container(
                  width: 300,
                  child: Text(
                    "Rất vui vì bạn đã sử dụng dịch vụ của chúng tôi",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 25),
                child: RatingBar.builder(
                  initialRating: _initialRating,
                  minRating: 1,
                  direction: _isVertical ? Axis.vertical : Axis.horizontal,
                  allowHalfRating: true,
                  unratedColor: Colors.amber.withAlpha(50),
                  itemCount: 5,
                  itemSize: 50.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    _selectedIcon ?? Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {});
                  },
                  updateOnDrag: true,
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 220,
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                      initialValue: "Sửa xe nhanh, nhiệt tình",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Type your comment here...',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 30, bottom: 10, right: 30, top: 10),
                    height: 80,
                    width: double.infinity,
                    color: Colors.white,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(6),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.white70;
                          return Color(
                              0xffF9AA33); // Defer to the widget's default.
                        }),
                      ),
                      onPressed: () {
                        controller.setStatus(1);
                        Get.back();
                      },
                      child: Text(
                        'Gửi',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // appBar: AppBar(
      //   title: Text(
      //     'Nguyễn Văn A',
      //     style: TextStyle(
      //       fontSize: 20.0,
      //       fontWeight: FontWeight.w500,
      //     ),
      //   ),
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios),
      //     onPressed: () {
      //       controller.setStatus(1);
      //       Get.back();
      //     },
      //   ),
      // ),
      // body: Container(
      //   child: Column(
      //     children: [
      //       Container(
      //         padding: EdgeInsets.only(top: 25, bottom: 25),
      //         child: RatingBar.builder(
      //           initialRating: _initialRating,
      //           minRating: 1,
      //           direction: _isVertical ? Axis.vertical : Axis.horizontal,
      //           allowHalfRating: true,
      //           unratedColor: Colors.amber.withAlpha(50),
      //           itemCount: 5,
      //           itemSize: 50.0,
      //           itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      //           itemBuilder: (context, _) => Icon(
      //             _selectedIcon ?? Icons.star,
      //             color: Colors.amber,
      //           ),
      //           onRatingUpdate: (rating) {
      //             setState(() {});
      //           },
      //           updateOnDrag: true,
      //         ),
      //       ),
      //       Expanded(
      //         flex: 1,
      //         child: Container(
      //           margin: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      //           padding: EdgeInsets.all(14.0),
      //           decoration: BoxDecoration(
      //             color: Colors.grey.shade100,
      //           ),
      //           child: TextFormField(
      //             keyboardType: TextInputType.multiline,
      //             maxLines: null,
      //             initialValue: "Sửa xe nhanh, nhiệt tình",
      //             style: TextStyle(
      //               fontSize: 21,
      //               fontWeight: FontWeight.w400,
      //             ),
      //             decoration: InputDecoration(
      //               hintText: 'Type your comment here...',
      //               border: InputBorder.none,
      //             ),
      //           ),
      //         ),
      //       ),
      //       Align(
      //         alignment: Alignment.bottomLeft,
      //         child: Container(
      //           padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
      //           height: 60,
      //           width: double.infinity,
      //           color: Colors.white,
      //           child: Row(
      //             crossAxisAlignment: CrossAxisAlignment.stretch,
      //             children: <Widget>[
      //               GestureDetector(
      //                 onTap: () {},
      //                 child: Icon(
      //                   Icons.camera_alt_rounded,
      //                   color: Colors.black87,
      //                   size: 30,
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: 8,
      //               ),
      //               GestureDetector(
      //                 onTap: () {},
      //                 child: Icon(
      //                   Icons.videocam,
      //                   color: Colors.black87,
      //                   size: 30,
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: 8,
      //               ),
      //               GestureDetector(
      //                 onTap: () {},
      //                 child: Icon(
      //                   Icons.keyboard_voice_sharp,
      //                   color: Colors.black87,
      //                   size: 30,
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: 15,
      //               ),
      //               Expanded(
      //                 child: SizedBox(),
      //               ),
      //               SizedBox(
      //                 width: 15,
      //               ),
      //               ElevatedButton(
      //                 onPressed: () {
      //                   controller.setStatus(1);
      //                   Get.back();
      //                 },
      //                 child: Text(
      //                   'Send',
      //                   style: TextStyle(
      //                     fontSize: 22,
      //                     fontWeight: FontWeight.w500,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
