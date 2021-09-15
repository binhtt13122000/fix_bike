import 'package:firebase_auth/firebase_auth.dart';
import 'package:fix_bike/components/button_custom.dart';
import 'package:fix_bike/components/text_field_pref_icon.dart';
import 'package:fix_bike/screens/repairman/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              'Đăng ký làm người sửa xe',
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      RawMaterialButton(
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
                      SizedBox(height: 20.0),
                      TextFieldInput(
                        labelText: 'Tên',
                        validator: (val) =>
                            val!.isEmpty ? "Tên không được để trống" : null,
                        icon: Icons.wysiwyg_rounded,
                        textEditingController: textUsernameController,
                        textInputType: TextInputType.emailAddress,
                        isErrorField: isErrorUsername,
                      ),
                      SizedBox(height: 10.0),
                      TextFieldInput(
                        labelText: 'Số điện thoại',
                        validator: (val) => val!.isEmpty
                            ? "Số điện thoại không được để trống"
                            : null,
                        icon: Icons.phone,
                        textEditingController: textUsernameController,
                        textInputType: TextInputType.emailAddress,
                        isErrorField: isErrorUsername,
                      ),
                      SizedBox(height: 10.0),
                      TextFieldInput(
                        labelText: 'Email',
                        validator: (val) =>
                            val!.isEmpty ? "Email không được để trống" : null,
                        icon: Icons.email_outlined,
                        textEditingController: textUsernameController,
                        textInputType: TextInputType.emailAddress,
                        isErrorField: isErrorUsername,
                      ),
                      SizedBox(height: 10.0),
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
                      SizedBox(height: 10.0),
                      TextFieldInput(
                        labelText: 'Địa chỉ',
                        validator: (val) =>
                            val!.isEmpty ? "Địa chỉ không được để trống" : null,
                        icon: Icons.location_on_outlined,
                        textEditingController: textUsernameController,
                        textInputType: TextInputType.emailAddress,
                        isErrorField: isErrorUsername,
                      ),
                      SizedBox(height: 10.0),
                      TextFieldInput(
                        labelText: 'Khu vực',
                        validator: (val) =>
                            val!.isEmpty ? "Khu vực không được để trống" : null,
                        icon: Icons.location_city,
                        textEditingController: textUsernameController,
                        textInputType: TextInputType.emailAddress,
                        isErrorField: isErrorUsername,
                      ),
                      SizedBox(height: 10.0),
                      TextFieldInput(
                        labelText: 'CMND/Căn Cước',
                        validator: (val) => val!.isEmpty
                            ? "CMND/Căn Cước không được để trống"
                            : null,
                        icon: Icons.perm_identity_outlined,
                        textEditingController: textUsernameController,
                        textInputType: TextInputType.emailAddress,
                        isErrorField: isErrorUsername,
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
                              textButton: "Đăng Ký",
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
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                            ButtonCustom(
                              bgColor: Colors.white,
                              bgColorPress: Colors.white,
                              textButton: "Đăng Nhập",
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
                                        builder: (context) => LoginPage()));
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



