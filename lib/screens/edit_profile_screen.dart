import 'package:fix_bike/components/text_field_pref_text.dart';
import 'package:fix_bike/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),
        title: Text(
          'Chỉnh sửa thông tin',
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 50, bottom: 30),
        child: Form(
          child: ListView(
            children: [
              TextFieldInput(
                labelText: 'Họ và tên',
                prefixText: 'Tên:',
                initialValue: 'Nguyễn Văn B',
                textInputType: TextInputType.name,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldInput(
                labelText: 'Ngày sinh',
                prefixText: 'Ngày sinh:',
                initialValue: '05/01/1998',
                textInputType: TextInputType.datetime,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldInput(
                labelText: 'Số điện thoại',
                prefixText: 'Số điện thoại:',
                initialValue: '0333848484',
                textInputType: TextInputType.phone,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldInput(
                labelText: 'Email',
                prefixText: 'Email:',
                initialValue: 'demo@gmail.com',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(4),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green.shade700;
                      }
                      return Colors
                          .green.shade500; // Defer to the widget's default.
                    }),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 14.0,
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Chỉnh sửa',
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
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
