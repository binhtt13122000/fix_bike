import 'package:firebase_auth/firebase_auth.dart';
import 'package:fix_bike/components/ButtonCustom.dart';
import 'package:fix_bike/components/TextFieldPrefIcon.dart';
import 'package:fix_bike/controller/AuthenticationController.dart';
import 'package:fix_bike/services/Auth.dart';
import 'package:fix_bike/styles/MyIcon.dart';
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
    final AuthenticationController controller =
        Get.put(AuthenticationController());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Color(0xFFA0D1F9),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width * 0.60,
                  child: Center(
                    child: Image(
                      image: AssetImage(imageCar),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.60,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                    color: Color(0xFFF3F3F5),
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(50.0),
                      topRight: const Radius.circular(50.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                  child: Obx(
                    () => controller.isLoading.isTrue
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : SingleChildScrollView(
                            child: Form(
                              key: _formKey,
                              child: Column(
                                // mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 3),
                                          child: Center(
                                            child: Text(
                                              'Mọi lúc - mọi nơi',
                                              style: TextStyle(
                                                fontFamily: 'RobotoMono',
                                                fontSize: 26.0,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // SizedBox(height: 15.0),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 0),
                                          child: TextField(
                                            controller: textUsernameController,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18.0),
                                            decoration: InputDecoration(
                                              labelText: "Tên",
                                              labelStyle: TextStyle(
                                                  color: Color(0xff888888),
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                        // SizedBox(height: 10.0),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 40),
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional.centerEnd,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 0),
                                                child: TextField(
                                                  controller:
                                                      textPasswordController,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.0),
                                                  obscureText: true,
                                                  decoration: InputDecoration(
                                                    labelText: "Mật khẩu",
                                                    labelStyle: TextStyle(
                                                        color:
                                                            Color(0xff888888),
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ),
                                              Text("Show",
                                                  style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ],
                                          ),
                                        ),
                                        // TextFieldInput(
                                        //   labelText: 'Email',
                                        //   validator: (val) => val!.isEmpty
                                        //       ? "Email không được để trống"
                                        //       : null,
                                        //   icon: Icons.email_outlined,
                                        //   textEditingController:
                                        //   textUsernameController,
                                        //   textInputType:
                                        //   TextInputType.emailAddress,
                                        //   isErrorField: isErrorUsername,
                                        // ),
                                        // SizedBox(height: 15.0),
                                        // TextFieldInput(
                                        //   labelText: 'Mật khẩu',
                                        //   validator: (val) => val!.isEmpty
                                        //       ? "Mật khẩu không được để trống"
                                        //       : null,
                                        //   icon: Icons.vpn_key,
                                        //   textEditingController:
                                        //   textPasswordController,
                                        //   isVisibleText: false,
                                        //   isErrorField: isErrorPassword,
                                        // ),
                                        SizedBox(height: 15.0),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 4,
                                            horizontal: 10,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
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
                                                edgeInsets:
                                                    EdgeInsets.symmetric(
                                                  vertical: 14.0,
                                                  horizontal: 14.0,
                                                ),
                                                handleFunction: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    _formKey.currentState!
                                                        .save();
                                                    setState(() {
                                                      isErrorUsername = false;
                                                      isErrorPassword = false;
                                                    });
                                                    controller
                                                        .authenticationWithUsernameAndPassword(
                                                            context,
                                                            textUsernameController
                                                                .value.text,
                                                            textPasswordController
                                                                .value.text);
                                                  } else {
                                                    setState(() {
                                                      isErrorUsername =
                                                          textUsernameController
                                                                      .value
                                                                      .text !=
                                                                  ""
                                                              ? false
                                                              : true;
                                                      isErrorPassword =
                                                          textPasswordController
                                                                      .value
                                                                      .text !=
                                                                  ""
                                                              ? false
                                                              : true;
                                                    });
                                                  }
                                                },
                                              ),
                                              SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                height: 90,
                                                width: double.infinity,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    new InkWell(
                                                        child: new Text(
                                                            'Đăng ký'),
                                                        onTap: () => Get.to(
                                                            RegisterPage())),
                                                    Text(
                                                      "Quên mật khẩu ?",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.blue),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              // Padding(
                                              //   padding: const EdgeInsets.only(
                                              //       left: 130),
                                              //   child: Text(
                                              //     "Quên mật khẩu ?",
                                              //     style:
                                              //         TextStyle(fontSize: 15),
                                              //   ),
                                              // ),
                                              // SizedBox(
                                              //   height: 18.0,
                                              // ),
                                              // ButtonCustom(
                                              //   bgColor: Colors.white,
                                              //   bgColorPress: Colors.white,
                                              //   textButton:
                                              //       "Đăng ký làm người sửa xe",
                                              //   imageUrl: "",
                                              //   textStyle: TextStyle(
                                              //     fontSize: 20.0,
                                              //     fontWeight: FontWeight.w600,
                                              //     color: Colors.black87,
                                              //   ),
                                              //   borderRadius: 8,
                                              //   edgeInsets:
                                              //       EdgeInsets.symmetric(
                                              //     vertical: 14.0,
                                              //     horizontal: 14.0,
                                              //   ),
                                              //   handleFunction: () {
                                              //     Navigator.pushReplacement(
                                              //         context,
                                              //         MaterialPageRoute(
                                              //             builder: (context) =>
                                              //                 RegisterPage()));
                                              //   },
                                              // ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
