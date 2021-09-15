import 'package:fix_bike/models/Order.dart';
import 'package:fix_bike/views/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_outlined),
            label: 'Thông tin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_outlined),
            label: 'Thông báo',
          ),
        ],
      ),
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
  String customerName, price, status, date;
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
              Divider(thickness: 2,),
            ],
          ),
        ),
      ),
    );
  }
}
