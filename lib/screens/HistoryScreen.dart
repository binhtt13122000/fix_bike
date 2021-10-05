import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/models/Order.dart';
import 'package:fix_bike/screens/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends GetWidget {
  List<Order> listOrder = [
    new Order(
        customerName: "Nguyễn Văn Tâm",
        price: "1.500.000VNĐ",
        status: "Đang sửa",
        date: "08/08/2021"),
    new Order(
        customerName: "Lê Trọng Nhân",
        price: "220.000VNĐ",
        status: "Đang sửa",
        date: "07/05/2021"),
    new Order(
        customerName: "Phạm Văn Danh",
        price: "300.000VNĐ",
        status: "Thành công",
        date: "05/01/2021"),
    new Order(
        customerName: "Trương Thanh Bình",
        price: "50.000VNĐ",
        status: "Hủy",
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
              width: MediaQuery.of(context).size.width,
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
  NotificationItem(
      {required this.customerName,
      required this.price,
      required this.status,
      required this.date});

  final String customerName, price, status, date;

  get children => null;

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListTile(
        title: Container(
          padding: EdgeInsets.only(top: 14),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
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
                                padding:
                                    const EdgeInsets.fromLTRB(140, 0, 0, 0),
                                child: Text(
                                  "Tổng:" + price,
                                  style: TextStyle(
                                    color: Colors.black,
                                    // fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 60, 130, 0),
                                child: Text(
                                  "Người sửa: " + customerName,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.fromLTRB(260, 60, 0, 0),
                              //   child: Icon(Icons.phone, color: Colors.orange),
                              // ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RaisedButton(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                // shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(20)),
                                onPressed: () {
                                  Get.back();
                                },
                                color: Colors.blue[100],
                                child: Text("Chi tiết",
                                    style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 2.2,
                                        color: Colors.black)),
                              ),
                              RaisedButton(
                                onPressed: () {
                                  Get.to(ProfilePage(),
                                      transition:
                                          Transition.rightToLeftWithFade,
                                      duration: Duration(microseconds: 600));
                                },
                                color: status == "Thành công"
                                    ? Colors.green
                                    : status == "Hủy"
                                        ? Colors.red
                                        : Colors.yellow[700],
                                padding: EdgeInsets.symmetric(
                                    horizontal: status == "Thành công"
                                        ? 50
                                        : status == "Hủy"
                                            ? 64
                                            : 40),
                                // padding: EdgeInsets.fromLTRB(10, 20, 10, 30
                                elevation: 2,
                                // shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  status == "Thành công"
                                      ? "Đã sửa"
                                      : status == "Hủy"
                                          ? "Hủy"
                                          : "Đang sửa",
                                  style: TextStyle(
                                      fontSize: 14,
                                      letterSpacing: 2.2,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
