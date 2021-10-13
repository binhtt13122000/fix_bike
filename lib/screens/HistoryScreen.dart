import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/models/Order.dart';
import 'package:fix_bike/screens/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: Color(0xFFF9AA33),
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
          style: GoogleFonts.lato(
            textStyle: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                decoration: TextDecoration.none),
          ),
        ),
        elevation: 0,
        backgroundColor: Color(0xFFF9AA33),
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
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  "Ngày",
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Text(
                                  date,
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(140, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Text(
                                      "Tổng: ",
                                      style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      price,
                                      style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                          // fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 60, 0, 0),
                                    child: Text(
                                      "Khách hàng: ",
                                      style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 60, 0, 0),
                                    child: Text(
                                      customerName,
                                      style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                          // fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                              Padding(
                                padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                                child: RaisedButton(
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  // padding: EdgeInsets.fromLTRB(40, 5, 40, 5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  color: Colors.blue[300],
                                  child: Text(
                                    "Chi tiết",
                                    style: GoogleFonts.robotoMono(
                                      textStyle: TextStyle(
                                        fontSize: 14,
                                        // letterSpacing: 1.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
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
                                  style: GoogleFonts.robotoMono(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      // letterSpacing: 1.2,
                                      color: Colors.black,
                                    ),
                                  ),
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
                height: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
