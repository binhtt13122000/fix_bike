import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/components/ButtonCustom.dart';
import 'package:fix_bike/screens/Home.dart';
import 'package:fix_bike/screens/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UpdatePurchasePage extends StatelessWidget {
  const UpdatePurchasePage({Key? key}) : super(key: key);

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
            Get.back();
          },
        ),
      ),
      bottomNavigationBar: BottomNav(),
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
                    height: 100,
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
            TileItem(
              prefixText: "Số tiền thanh toán: ",
              value: "150.000 VNĐ",
              maxLines: 2,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonCustom(
                  handleFunction: () => {Get.back()},
                  bgColor: Colors.red.shade600,
                  bgColorPress: Colors.red.shade800,
                  textButton: "Hủy",
                  imageUrl: "",
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  borderRadius: 8,
                  edgeInsets: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                ),
                ButtonCustom(
                  bgColor: Colors.green.shade500,
                  bgColorPress: Colors.green.shade700,
                  textButton: "Xác nhận",
                  imageUrl: "",
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  borderRadius: 8,
                  edgeInsets: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                  handleFunction: () {
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
