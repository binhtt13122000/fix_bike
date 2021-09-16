import 'package:fix_bike/components/button_custom.dart';
import 'package:fix_bike/screens/home2.dart';
import 'package:fix_bike/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BikeStatusPage extends StatefulWidget {
  const BikeStatusPage({Key? key}) : super(key: key);

  @override
  _BikeStatusPageState createState() => _BikeStatusPageState();
}

class _BikeStatusPageState extends State<BikeStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tình trạng xe',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),
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
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              decoration: new BoxDecoration(
                color: Colors.grey.shade300,
              ),
              child: ListTile(
                title: Text(
                  'Thông tin của xe',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TileItem(
              prefixText: 'Thương hiệu xe: ',
              value: 'Honda',
            ),
            Divider(
              height: 1,
            ),
            TileItem(
              prefixText: "Loại xe: ",
              value: "Wave 2019",
            ),
            Divider(
              height: 1,
            ),
            TileItem(
              prefixText: "Địa chỉ: ",
              value: "12 Nguyễn Thị Minh Khai, Quận 1, tp Hồ Chí Minh",
              maxLines: 2,
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tình trạng xe: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    height: 220,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black54,
                          width: 2,
                        )),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      initialValue: "Xe bị bể bánh",
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonCustom(
                  bgColor: Colors.green.shade500,
                  bgColorPress: Colors.green.shade700,
                  textButton: "Xác nhận",
                  imageUrl: "",
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  borderRadius: 8,
                  edgeInsets: EdgeInsets.symmetric(
                    vertical: 14.0,
                    horizontal: 14.0,
                  ),
                  handleFunction: () {
                    Get.to(() => Home2());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TileItem extends StatelessWidget {
  TileItem({required this.prefixText, required this.value, this.maxLines = 1});

  final String prefixText, value;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      initialValue: value,
      keyboardType: TextInputType.multiline,
      style: TextStyle(
        fontSize: 18,
      ),
      maxLines: maxLines,
      decoration: InputDecoration(
          labelStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          prefixText: prefixText,
          prefixStyle: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
