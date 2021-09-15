import 'package:fix_bike/views/edit_profile_screen.dart';
import 'package:fix_bike/views/history_screen.dart';
import 'package:fix_bike/views/notifi_screen.dart';
import 'package:fix_bike/views/support_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NotificationPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
              child: Center(
                child: RawMaterialButton(
                  onPressed: () {},
                  elevation: 2.0,
                  fillColor: Colors.grey,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  padding: EdgeInsets.all(28.0),
                  shape: CircleBorder(),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    decoration: new BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                    child: ListTile(
                      title: Text(
                        'Thông tin cơ bản',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: RawMaterialButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfilePage()));
                          },
                          child: Icon(
                            Icons.edit,
                            size: 60,
                            color: Colors.black87,
                          )),
                    ),
                  ),
                  TileItem(
                    title: 'Nguyễn Văn B',
                    icon: Icons.person,
                  ),
                  Divider(
                    height: 1,
                  ),
                  TileItem(
                    title: 'Ngày sinh: 05/01/1998',
                    icon: Icons.date_range_outlined,
                  ),
                  Divider(
                    height: 1,
                  ),
                  TileItem(
                    title: '+1 510 486 1234',
                    icon: Icons.phone_android,
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                    child: ListTile(
                      title: Text(
                        'Tài khoản của tôi',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TileItem(
                    title: 'Lịch sử',
                    icon: Icons.history,
                    handleFunction: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HistoryPage()));
                    },
                  ),
                  Divider(
                    height: 1,
                  ),
                  TileItem(
                    title: 'Hổ trợ',
                    icon: Icons.support_agent_outlined,
                    handleFunction: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SupportPage()));
                    },
                  ),
                  Divider(
                    height: 1,
                  ),
                  TileItem(
                    title: 'Thay đổi mật khẩu',
                    icon: Icons.vpn_key_outlined,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 25, horizontal: 20.0),
                    decoration: new BoxDecoration(
                      color: Colors.grey.shade300,
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(4),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.red.shade900;
                          }
                          return Colors
                              .red.shade800; // Defer to the widget's default.
                        }),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 14.0,
                          ),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Log Out',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TileItem extends StatelessWidget {
  TileItem({required this.title, required this.icon, this.handleFunction});

  String title;
  IconData icon;
  Function()? handleFunction;
  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Colors.grey.shade100,
      child: ListTile(
        onTap: () {
          handleFunction != null && handleFunction!();
        },
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
