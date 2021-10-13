import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/components/TextFieldPrefText.dart';
import 'package:fix_bike/screens/ProfileScreen.dart';
import 'package:fix_bike/screens/settings.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFFA0D1F9),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        // padding: EdgeInsets.only(left: 16, top: 0, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              // Text(
              //   "Edit Profile",
              //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              Center(
                child: Stack(
                  children: [
                    // Container(
                    //   width: 130,
                    //   height: 130,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(
                    //           width: 4,
                    //           color: Theme.of(context).scaffoldBackgroundColor),
                    //       boxShadow: [
                    //         BoxShadow(
                    //             spreadRadius: 2,
                    //             blurRadius: 10,
                    //             color: Colors.black.withOpacity(0.1),
                    //             offset: Offset(0, 10))
                    //       ],
                    //       shape: BoxShape.circle,
                    //       image: DecorationImage(
                    //         fit: BoxFit.cover,
                    //         image: AssetImage(avatar),
                    //       )),
                    // ),
                    Container(
                      color: Color(0xFFf9aa33),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(110, 50, 110, 30),
                        child: SizedBox(
                          height: 150,
                          width: 400,
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
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Positioned(
                    //     bottom: 0,
                    //     right: 40,
                    //     top: 5,
                    //     child: Container(
                    //       height: 40,
                    //       width: 40,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         border: Border.all(
                    //           width: 4,
                    //           color: Theme.of(context).scaffoldBackgroundColor,
                    //         ),
                    //         color: Color(0xFFA0D1F9),
                    //       ),
                    //       child: Icon(
                    //         Icons.edit,
                    //         color: Colors.white,
                    //       ),
                    //     )
                    //     ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              buildTextField("Tên", "Nguyễn Văn Tâm", false),
              buildTextField("Ngày sinh", "05/01/1998", false),
              buildTextField("E-mail", "vana@gmail.com", false),
              buildTextField("Điện thoại", "0333568696", false),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      color: Color(0xFFf9aa33),
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      // padding: EdgeInsets.fromLTRB(10, 20, 10, 30),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text("Lưu",
                          style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white),
                          )),
                    )
                  ],
                ),
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
  return Padding(
    padding: const EdgeInsets.only(bottom: 35.0, right: 20, left: 20),
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
