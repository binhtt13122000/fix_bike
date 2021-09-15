import 'package:firebase_auth/firebase_auth.dart';
import 'package:fix_bike/components/button_custom.dart';
import 'package:fix_bike/components/text_field_pref_icon.dart';
import 'package:fix_bike/controller/AuthenticationController.dart';
import 'package:fix_bike/services/auth.dart';
import 'package:fix_bike/styles/my_icons.dart';
import 'package:fix_bike/screens/repairman/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textUsernameController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isErrorUsername = false, isErrorPassword = false;

  checkAuthentication() async {
    if (_auth.currentUser != null) {}
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationController controller = Get.put(AuthenticationController());
    return Scaffold(
      body: SafeArea(
        child:  Obx(() => controller.isLoading.isTrue ? Center(
          child: CircularProgressIndicator(),
        ): SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 180.0,
                      width: 600.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: SvgPicture.asset(iconLogin),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        child: Center(
                          child: Text(
                            'Đăng Nhập',
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      TextFieldInput(
                        labelText: 'Email',
                        validator: (val) =>
                        val!.isEmpty ? "Email không được để trống" : null,
                        icon: Icons.email_outlined,
                        textEditingController: textUsernameController,
                        textInputType: TextInputType.emailAddress,
                        isErrorField: isErrorUsername,
                      ),
                      SizedBox(height: 15.0),
                      TextFieldInput(
                        labelText: 'Mật khẩu',
                        validator: (val) => val!.isEmpty
                            ? "Mật khẩu không được để trống"
                            : null,
                        icon: Icons.vpn_key,
                        textEditingController: textPasswordController,
                        isVisibleText: false,
                        isErrorField: isErrorPassword,
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ButtonCustom(
                              bgColor: Color(0xff1877f2),
                              bgColorPress: Color(0xff1877f2),
                              textButton: "Đăng Nhập",
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
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  setState(() {
                                    isErrorUsername = false;
                                    isErrorPassword = false;
                                  });
                                  controller.authenticationWithUsernameAndPassword(context,
                                      textUsernameController.value.text,
                                      textPasswordController.value.text
                                  );
                                } else {
                                  setState(() {
                                    isErrorUsername =
                                    textUsernameController.value.text != ""
                                        ? false
                                        : true;
                                    isErrorPassword =
                                    textPasswordController.value.text != ""
                                        ? false
                                        : true;
                                  });
                                }
                              },
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            ButtonCustom(
                              bgColor: Colors.white,
                              bgColorPress: Colors.white,
                              textButton: "Đăng ký làm người sửa xe",
                              imageUrl: "",
                              textStyle: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                              borderRadius: 8,
                              edgeInsets: EdgeInsets.symmetric(
                                vertical: 14.0,
                                horizontal: 14.0,
                              ),
                              handleFunction: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),)
      ),
    );
  }
}
