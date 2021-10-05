import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/models/Order.dart';
import 'package:fix_bike/models/Promo.dart';
import 'package:fix_bike/screens/HistoryScreen.dart';
import 'package:fix_bike/screens/Home.dart';
import 'package:fix_bike/screens/ProfileScreen.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends GetWidget {
  List<Promo> listPro = [
    new Promo(
        promo: "Giảm 10% phí sửa",
        message: "Sử dụng code Cpro10 để giảm 10% phí sửa xe",
        date: "Hiệu lực: 30/09 - 30/10"),
    new Promo(
        promo: "Giảm 12% phí sửa",
        message: "Sử dụng code Cpro10 để giảm 12% phí sửa xe",
        date: "Hiệu lực: 30/09 - 30/10"),
    new Promo(
        promo: "Giảm 37.5% phí sửa",
        message: "Sử dụng code Cpro10 để giảm 37.5% phí sửa xe",
        date: "Hiệu lực: 30/09 - 12/10"),
    new Promo(
        promo: "Giảm 50% phí sửa",
        message: "Sử dụng code Cpro10 để giảm 50% phí sửa xe",
        date: "Hiệu lực: 30/09 - 02/10"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thông báo',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        // leading: Icon(Icons.arrow_back_ios),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNav(),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              color: Colors.white54,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: listPro.length,
                  itemBuilder: (BuildContext context, index) {
                    return NotificationItem(
                      promo: listPro[index].promo,
                      message: listPro[index].message,
                      date: listPro[index].date,
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

// class NotificationItem extends StatefulWidget {
//   const NotificationItem({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _NotificationItemState createState() => _NotificationItemState();
// }

class NotificationItem extends StatelessWidget {
  // bool _isSelected = false;

  final String promo, message, date;

  NotificationItem(
      {required this.promo, required this.message, required this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4, left: 12, right: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Ink(
        color: Colors.grey[100],
        child: ListTile(
          onTap: () {
            // setState(() {
            //   _isSelected = !_isSelected;
            // });
          },
          title: Container(
            padding: EdgeInsets.only(top: 14, bottom: 10),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(8),
            //     border: Border.all(width: 0.5)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Checkbox(
                //     shape: CircleBorder(),
                //     value: _isSelected,
                //     onChanged: (value) {
                //       setState(() {
                //         _isSelected = value!;
                //       });
                //     }),
                // Icon(
                //   CupertinoIcons.person_crop_square,
                //   size: 40,
                // ),
                // CircleAvatar(),
                // Image(image: AssetImage(promo), width: 50, height: 50,),
                Container(
                    padding: EdgeInsets.all(30),
                    child:
                        // CircleAvatar(
                        //
                        //   backgroundImage:
                        //   AssetImage(promo),
                        // ),
                        Image(
                      image: AssetImage(iconPromo),
                      width: 60,
                      height: 60,
                    )),
                // SizedBox(
                //   width: 10.0,
                // ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 5, 5),
                        child: Text(
                          promo,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        message,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: Text(
                          date,
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            // color: Colors.grey.shade300,
                            fontWeight: FontWeight.w300,
                          ),
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
