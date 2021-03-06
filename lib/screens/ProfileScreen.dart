import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/components/ProfileMenu.dart';
import 'package:fix_bike/screens/EditProfileScreen.dart';
import 'package:fix_bike/screens/HistoryScreen.dart';
import 'package:fix_bike/screens/SupportScreen.dart';
import 'package:fix_bike/screens/VehicleScreen.dart';
import 'package:fix_bike/screens/settings.dart';
import 'package:fix_bike/screens/user/LoginScreen.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'https://flutter.dev';

class ProfilePage extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xFFf9aa33),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(110, 50, 110, 30),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(avatar),
                      ),
                      Positioned(
                        right: -16,
                        bottom: 0,
                        child: SizedBox(
                          height: 46,
                          width: 46,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(color: Colors.black),
                              ),
                              primary: Colors.black,
                              backgroundColor: Color(0xFFF5F6F9),
                            ),
                            onPressed: () {},
                            child: Icon(Icons.camera_alt_outlined),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            ProfileMenu(
              text: "T??i kho???n c???a t??i",
              icon: accountIcon,
              press: () => {
                Get.to(() => EditProfilePage(),
                    transition: Transition.rightToLeftWithFade,
                    duration: Duration(milliseconds: 600))
              },
            ),
            ProfileMenu(
              text: "Ph????ng ti???n c???a t??i",
              icon: carIcon,
              press: () => {
                Get.to(() => VerhiclePage(),
                    transition: Transition.rightToLeftWithFade,
                    duration: Duration(milliseconds: 600))
              },
            ),
            ProfileMenu(
              text: "L???ch s???",
              icon: iconHistory,
              press: () {
                Get.to(() => HistoryPage(),
                    transition: Transition.leftToRightWithFade,
                    duration: Duration(microseconds: 600));
              },
            ),
            ProfileMenu(
              text: "C??i ?????t",
              icon: iconSetting,
              press: () {
                Get.to(() => SettingsPage(),
                    transition: Transition.leftToRightWithFade,
                    duration: Duration(microseconds: 600));
              },
            ),
            ProfileMenu(
              text: "H??? tr???",
              icon: iconSupport,
              press: _launchURL,
              // Get.to(() => SupportPage(),
              //     transition: Transition.leftToRightWithFade,
              //     duration: Duration(microseconds: 600));
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 10, right: 50),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(80.0),
                color: Colors.red,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {
                    // Get.offAll(() => LoginPage(),
                    //     transition: Transition.leftToRightWithFade,
                    //     duration: Duration(microseconds: 600));
                  },
                  child: Text("????ng xu???t",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0)
                          .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            // Expanded(
            //   child: ListView(
            //     children: [
            //       Container(
            //         decoration: new BoxDecoration(
            //           color: Colors.grey.shade300,
            //         ),
            //         child: ListTile(
            //           title: Text(
            //             'Th??ng tin c?? b???n',
            //             style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           trailing: RawMaterialButton(
            //               onPressed: () {
            //                 Get.to(() => EditProfilePage(),
            //                     transition: Transition.rightToLeftWithFade,
            //                     duration: Duration(milliseconds: 600));
            //               },
            //               child: Icon(
            //                 Icons.edit,
            //                 size: 60,
            //                 color: Colors.black87,
            //               )),
            //         ),
            //       ),
            //       TileItem(
            //         title: 'Nguy???n V??n B',
            //         icon: Icons.person,
            //       ),
            //       Divider(
            //         height: 1,
            //       ),
            //       TileItem(
            //         title: 'Ng??y sinh: 05/01/1998',
            //         icon: Icons.date_range_outlined,
            //       ),
            //       Divider(
            //         height: 1,
            //       ),
            //       TileItem(
            //         title: '+1 510 486 1234',
            //         icon: Icons.phone_android,
            //       ),
            //       Container(
            //         decoration: new BoxDecoration(
            //           color: Colors.grey.shade300,
            //         ),
            //         child: ListTile(
            //           title: Text(
            //             'T??i kho???n c???a t??i',
            //             style: TextStyle(
            //               fontSize: 20,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         ),
            //       ),
            //       TileItem(
            //         title: 'L???ch s???',
            //         icon: Icons.history,
            //         handleFunction: () {
            //           Get.to(() => HistoryPage(),
            //               transition: Transition.rightToLeftWithFade,
            //               duration: Duration(microseconds: 600));
            //         },
            //       ),
            //       Divider(
            //         height: 1,
            //       ),
            //       TileItem(
            //         title: 'H??? tr???',
            //         icon: Icons.support_agent_outlined,
            //         handleFunction: () {
            //           Get.to(() => SupportPage(),
            //               transition: Transition.rightToLeftWithFade,
            //               duration: Duration(microseconds: 600));
            //         },
            //       ),
            //       Divider(
            //         height: 1,
            //       ),
            //       TileItem(
            //         title: 'Thay ?????i m???t kh???u',
            //         icon: Icons.vpn_key_outlined,
            //       ),
            //       Container(
            //         padding:
            //             EdgeInsets.symmetric(vertical: 25, horizontal: 20.0),
            //         decoration: new BoxDecoration(
            //           color: Colors.grey.shade300,
            //         ),
            //         child: ElevatedButton(
            //           onPressed: () {
            //             Get.offAll(() => LoginPage(),
            //                 transition: Transition.leftToRightWithFade,
            //                 duration: Duration(microseconds: 600));
            //           },
            //           style: ButtonStyle(
            //             elevation: MaterialStateProperty.all(4),
            //             backgroundColor:
            //                 MaterialStateProperty.resolveWith<Color>(
            //                     (Set<MaterialState> states) {
            //               if (states.contains(MaterialState.pressed)) {
            //                 return Colors.red.shade900;
            //               }
            //               return Colors
            //                   .red.shade800; // Defer to the widget's default.
            //             }),
            //             padding: MaterialStateProperty.all<EdgeInsets>(
            //               EdgeInsets.symmetric(
            //                 vertical: 12.0,
            //                 horizontal: 14.0,
            //               ),
            //             ),
            //             shape:
            //                 MaterialStateProperty.all<RoundedRectangleBorder>(
            //                     RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(8),
            //             )),
            //           ),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Text(
            //                 'Log Out',
            //                 style: TextStyle(
            //                   fontSize: 20.0,
            //                   fontWeight: FontWeight.w600,
            //                   color: Colors.white,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class TileItem extends StatelessWidget {
  TileItem({required this.title, required this.icon, this.handleFunction});

  final String title;
  final IconData icon;
  final Function()? handleFunction;

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Colors.grey.shade100,
      child: ListTile(
        onTap: handleFunction,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(
          icon,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
