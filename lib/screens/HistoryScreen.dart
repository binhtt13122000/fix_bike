import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/models/Order.dart';
import 'package:fix_bike/screens/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends GetWidget {
  List<Order> listOrder = [
    new Order(
        customerName: "Nguyễn Văn A",
        price: "1.500.000VNĐ",
        status: "Thành công",
        date: "08/08/2021"),
    new Order(
        customerName: "Lê Văn A",
        price: "220.000VNĐ",
        status: "Thành công",
        date: "07/05/2021"),
    new Order(
        customerName: "Trần Ngọc A",
        price: "300.000VNĐ",
        status: "Thành công",
        date: "05/01/2021"),
    new Order(
        customerName: "Đặng Thị T",
        price: "50.000VNĐ",
        status: "Thành công",
        date: "12/12/2020"),
    new Order(
        customerName: "Lưu Gia Thịnh",
        price: "40.000VNĐ",
        status: "Thành công",
        date: "11/08/2020"),
    new Order(
        customerName: "Tạ Bội Châu",
        price: "30.000VNĐ",
        status: "Thành công",
        date: "08/04/2020"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30.0,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Lịch sử",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNav(),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0)),
                  color: Colors.white),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: listOrder.length,
                  itemBuilder: (BuildContext context, index) {
                    return NotificationItem(
                      customerName: listOrder[index].name,
                      price: listOrder[index].price,
                      date: listOrder[index].date,
                      status: listOrder[index].status,
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  NotificationItem({required this.customerName,
    required this.price,
    required this.status,
    required this.date});

  final String customerName, price, status, date;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE5E5E5),
      child: ListTile(
        title: Container(
          padding: EdgeInsets.only(top: 14),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Text(
                                      "Ngày",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Text(
                                      date,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(140, 0, 0, 0),
                                    child: Text(
                                      "Tổng:" + price,
                                      style: TextStyle(
                                        color: Colors.black,
                                        // fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 60, 120, 0),
                                    child: Text(
                                      "Tên người sửa: " + customerName,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(260, 60, 0, 0),
                                    child: Icon(Icons.phone, color: Colors.orange),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                                    child: Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Text(
                                              "Chi tiết",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: const EdgeInsets.only(top: 8),
                                            //   child: Text(
                                            //     "\nXem chi tiết",
                                            //     style: TextStyle(
                                            //       color: Colors.black,
                                            //       fontWeight: FontWeight.w300,
                                            //       fontStyle: FontStyle.italic,
                                            //     ),
                                            //   ),
                                            // ),
                                            // Padding(
                                            //   padding:
                                            //   const EdgeInsets.only(left: 260),
                                            //   child: Icon(
                                            //       Icons.keyboard_arrow_down_sharp),
                                            // )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty
                                      .resolveWith<Color>((Set<
                                      MaterialState>
                                  states) {
                                    if (states.contains(
                                        MaterialState.pressed))
                                      return Colors.white70;
                                    return Color(
                                        0xff00660B); // Defer to the widget's default.
                                  }),

                                ),
                                onPressed: () => {},
                                child: Container(
                                  width: double.infinity,
                                  child: Center(child: Text("Đã Sửa")),
                                )
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 18,
              ),
            ],
          )
          ,
        )
        ,
      )
      ,
    );
  }
}

