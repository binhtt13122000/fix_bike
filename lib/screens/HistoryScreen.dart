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
        price: "150.000VNĐ",
        status: "Thành công",
        date: "08/04/2021"),
    new Order(
        customerName: "Nguyễn Văn A",
        price: "150.000VNĐ",
        status: "Thành công",
        date: "08/04/2021"),
    new Order(
        customerName: "Nguyễn Văn A",
        price: "150.000VNĐ",
        status: "Thành công",
        date: "08/04/2021"),
    new Order(
        customerName: "Nguyễn Văn A",
        price: "150.000VNĐ",
        status: "Thành công",
        date: "08/04/2021"),
    new Order(
        customerName: "Nguyễn Văn A",
        price: "150.000VNĐ",
        status: "Thành công",
        date: "08/04/2021"),
    new Order(
        customerName: "Nguyễn Văn A",
        price: "150.000VNĐ",
        status: "Thành công",
        date: "08/04/2021"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Lịch sử',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNav(),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 5, right: 5),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4, left: 12, right: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      child: ListTile(
        title: Container(
          padding: EdgeInsets.only(top: 14, bottom: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tên khách hàng: " + customerName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Số tiền sửa: " + price,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Trạng thái: " + status,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Ngày: " + date,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 18,
              ),
              Divider(
                thickness: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
