import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/screens/Home.dart';
import 'package:fix_bike/screens/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {

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
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 5, right: 5),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 50,
                itemBuilder: (BuildContext context, index) {
                  return NotificationItem();
                }),
          )
        ],
      ),
    );
  }
}

class NotificationItem extends StatefulWidget {
  const NotificationItem({
    Key? key,
  }) : super(key: key);

  @override
  _NotificationItemState createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4, left: 12, right: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
      child: Ink(
        color: Colors.grey.shade100,
        child: ListTile(
          onTap: () {
            setState(() {
              _isSelected = !_isSelected;
            });
          },
          title: Container(
            padding: EdgeInsets.only(top: 14, bottom: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                    shape: CircleBorder(),
                    value: _isSelected,
                    onChanged: (value) {
                      setState(() {
                        _isSelected = value!;
                      });
                    }),
                Icon(
                  CupertinoIcons.person_crop_square,
                  size: 40,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ưu đãi 10% phí sửa xe ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '12 phút trước',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade300,
                          fontWeight: FontWeight.w300,
                        ),
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
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
