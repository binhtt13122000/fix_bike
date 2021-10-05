import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/screens/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListVehicles extends StatelessWidget {
  const ListVehicles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Phương tiện của tôi",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFFF9AA33),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: VehicalListing(),
    );
  }
}

class VehicalListing extends StatelessWidget {
  const VehicalListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.add_box_outlined,
                    size: 20,
                  ),
                  Text(
                    "  Thêm một phương tiện mới",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              Icon(
                Icons.navigate_next,
                size: 20,
              )
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.directions_car_filled_outlined,
                              size: 23,
                            ),
                            Text(
                              "  Vinfast LUX A2.0",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        RichText(
                          text: new TextSpan(
                            text: 'Chọn',
                            style: new TextStyle(color: Colors.blue),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(Home());
                              },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hãng xe: VINFAST",
                      style: TextStyle(color: Colors.grey[500], fontSize: 16),
                    ),
                    Text(
                      "Màu sắc: Trắng bạc",
                      style: TextStyle(color: Colors.grey[500], fontSize: 16),
                    ),
                    Text("Biển số: 30A - 128.93",
                        style:
                            TextStyle(color: Colors.grey[500], fontSize: 16)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Trương Thanh Bình - 0335579880",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.directions_bike_outlined,
                              size: 23,
                            ),
                            Text(
                              "  Yamaha Exciter 155 VVA",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        RichText(
                          text: new TextSpan(
                            text: 'Chọn',
                            style: new TextStyle(color: Colors.blue),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(Home());
                              },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hãng xe: Yamaha",
                      style: TextStyle(color: Colors.grey[500], fontSize: 16),
                    ),
                    Text(
                      "Màu sắc: Đỏ, trắng",
                      style: TextStyle(color: Colors.grey[500], fontSize: 16),
                    ),
                    Text("Biển số: 59K1 - 858.81",
                        style:
                            TextStyle(color: Colors.grey[500], fontSize: 16)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Phạm Văn Danh - 0985221544",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.directions_car_filled_outlined,
                              size: 23,
                            ),
                            Text(
                              "  Mercedes-Benz C 200 Exclusive",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        RichText(
                          text: new TextSpan(
                            text: 'Chọn',
                            style: new TextStyle(color: Colors.blue),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(Home());
                              },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hãng xe: Mercedes",
                      style: TextStyle(color: Colors.grey[500], fontSize: 16),
                    ),
                    Text(
                      "Màu sắc: Đen",
                      style: TextStyle(color: Colors.grey[500], fontSize: 16),
                    ),
                    Text("Biển số: 90A - 999.99",
                        style:
                            TextStyle(color: Colors.grey[500], fontSize: 16)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Trương Thanh Bình - 0335579880",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
