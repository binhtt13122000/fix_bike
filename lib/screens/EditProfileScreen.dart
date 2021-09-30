import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/components/TextFieldPrefText.dart';
import 'package:fix_bike/screens/ProfileScreen.dart';
import 'package:fix_bike/screens/settings.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends GetWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     leading: IconButton(
    //       icon: Icon(Icons.arrow_back_ios),
    //       onPressed: () {
    //         Get.back();
    //       },
    //     ),
    //     title: Text(
    //       'Chỉnh sửa thông tin',
    //       style: TextStyle(
    //         fontSize: 20.0,
    //         fontWeight: FontWeight.w500,
    //       ),
    //     ),
    //     centerTitle: true,
    //   ),
    //   bottomNavigationBar: BottomNav(),
    //   body: Container(
    //     color: Colors.white,
    //     margin: EdgeInsets.only(top: 50, bottom: 30),
    //     child: Form(
    //       child: ListView(
    //         children: [
    //           TextFieldInput(
    //             labelText: 'Họ và tên',
    //             prefixText: 'Tên:',
    //             initialValue: 'Nguyễn Văn B',
    //             textInputType: TextInputType.name,
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           TextFieldInput(
    //             labelText: 'Ngày sinh',
    //             prefixText: 'Ngày sinh:',
    //             initialValue: '05/01/1998',
    //             textInputType: TextInputType.datetime,
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           TextFieldInput(
    //             labelText: 'Số điện thoại',
    //             prefixText: 'Số điện thoại:',
    //             initialValue: '0333848484',
    //             textInputType: TextInputType.phone,
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           TextFieldInput(
    //             labelText: 'Email',
    //             prefixText: 'Email:',
    //             initialValue: 'demo@gmail.com',
    //             textInputType: TextInputType.emailAddress,
    //           ),
    //           SizedBox(
    //             height: 40,
    //           ),
    //           Container(
    //             margin: EdgeInsets.only(left: 20, right: 20),
    //             child: ElevatedButton(
    //               onPressed: () {
    //                 Get.to(() => ProfilePage(),
    //                     transition: Transition.leftToRightWithFade,
    //                     duration: Duration(milliseconds: 600));
    //               },
    //               style: ButtonStyle(
    //                 elevation: MaterialStateProperty.all(4),
    //                 backgroundColor: MaterialStateProperty.resolveWith<Color>(
    //                     (Set<MaterialState> states) {
    //                   if (states.contains(MaterialState.pressed)) {
    //                     return Colors.green.shade700;
    //                   }
    //                   return Colors
    //                       .green.shade500; // Defer to the widget's default.
    //                 }),
    //                 padding: MaterialStateProperty.all<EdgeInsets>(
    //                   EdgeInsets.symmetric(
    //                     vertical: 12.0,
    //                     horizontal: 14.0,
    //                   ),
    //                 ),
    //                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //                     RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(8),
    //                 )),
    //               ),
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Text(
    //                     'Chỉnh sửa',
    //                     style: TextStyle(
    //                       fontSize: 20.0,
    //                       fontWeight: FontWeight.w600,
    //                       color: Colors.white,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(avatar),
                              )),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Tên", "Nguyễn Văn A", false),
              buildTextField("Ngày sinh", "05/01/1998", false),
              buildTextField("E-mail", "vana@gmail.com", false),
              buildTextField("Điện thoại", "0333568696", false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Hủy",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Get.to(ProfilePage(),
                          transition: Transition.rightToLeftWithFade,
                          duration: Duration(microseconds: 600));
                    },
                    color: Color(0xFFA0D1F9),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Lưu",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(
    String labelText, String placeholder, bool isPasswordTextField) {
  // return Padding(
  //   padding: const EdgeInsets.fromLTRB(
  //       0, 0, 0, 20),
  //   child: TextField(
  //     style: TextStyle(
  //         color: Colors.black,
  //         // fontWeight: FontWeight.bold,
  //         fontSize: 18.0),
  //     decoration: InputDecoration(
  //       labelText: "Tên",
  //       labelStyle: TextStyle(
  //           color: Color(0xff888888),
  //           fontSize: 15),
  //     ),
  //   ),
  // );
  return Padding(
    padding: const EdgeInsets.only(bottom: 35.0),
    child: TextField(
      decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    ),
  );
}

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}
