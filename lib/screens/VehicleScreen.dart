import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class VerhiclePage extends GetWidget {
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
          "Phương tiện",
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
              child: Container(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 0,
                    itemBuilder: (BuildContext context, index) {
                      return VerhicleItem();
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class VerhicleItem extends StatelessWidget {
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
                Container(
                    // padding: EdgeInsets.all(30),
                    child: Image(
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
                          "Ngay",
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
                        "Ngay",
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
                          "Ngay",
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
