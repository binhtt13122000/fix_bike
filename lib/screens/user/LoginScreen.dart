import 'package:fix_bike/components/TextFieldPrefIcon.dart';
import 'package:fix_bike/controller/AuthenticationController.dart';
import 'package:fix_bike/screens/home.dart';
import 'package:fix_bike/services/Auth.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Color(0xFFA0D1F9),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.40,
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
                height: MediaQuery.of(context).size.height * 0.61,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                    color: Color(0xFFF3F3F5),
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(50.0),
                      topRight: const Radius.circular(50.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, top: 0, right: 0),
                  child: Obx(
                    () => controller.isLoading.isTrue
                        ? Center(child: CircularProgressIndicator())
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // SizedBox(height: 11.5),
                                          Container(
                                            child: Text(
                                              'Mọi lúc - Mọi Nơi',
                                              style: TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                          // SizedBox(height: 30.0),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 20),
                                            child: TextField(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  // fontWeight: FontWeight.bold,
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
                                                0, 0, 0, 20),
                                            child: Stack(
                                              alignment: AlignmentDirectional
                                                  .centerEnd,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 0, 0, 0),
                                                  child: TextField(
                                                    style: TextStyle(
                                                        color: Colors.black,
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
                                                Text("Hiển thị",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold))
                                              ],
                                            ),
                                          ),

                                          // SizedBox(height: 10.0),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, top: 20, right: 0),
                                            child: Material(
                                              elevation: 5.0,
                                              borderRadius:
                                                  BorderRadius.circular(80.0),
                                              color: Color(0xFFA0D1F9),
                                              child: MaterialButton(
                                                minWidth: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                padding: EdgeInsets.fromLTRB(
                                                    20.0, 15.0, 20.0, 15.0),
                                                onPressed: () {},
                                                child: Text("Đăng nhập",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                            fontFamily:
                                                                'Montserrat',
                                                            fontSize: 20.0)
                                                        .copyWith(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                              ),
                                            ),
                                          ),
                                          // SizedBox(height: 30),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                            child: Container(
                                              height: 70,
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    "Đăng ký",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    "Quên mật khẩu?",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.blue),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 0),
                                            child: Text(
                                              'Tiếp tục với',
                                              textAlign: TextAlign.center,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 10, 20, 23),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Get.to(Home());
                                                // controller
                                                //     .authenticationWithGoogle(
                                                //         context);
                                              },
                                              style: ButtonStyle(
                                                elevation:
                                                    MaterialStateProperty.all(
                                                        6),
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .resolveWith<Color>(
                                                            (Set<MaterialState>
                                                                states) {
                                                  if (states.contains(
                                                      MaterialState.pressed))
                                                    return Colors.white70;
                                                  return Color(
                                                      0xfff5f8fd); // Defer to the widget's default.
                                                }),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                )),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image(
                                                    image:
                                                        AssetImage(iconGoogle),
                                                    height: 39,
                                                  ),
                                                  SizedBox(
                                                    width: 16,
                                                  ),

                                                  Image(
                                                    image: AssetImage(
                                                        iconFacebook),
                                                    height: 35,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Image(
                                                    image:
                                                        AssetImage(iconApple),
                                                    height: 35,
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Image(
                                                    image: AssetImage(iconZalo),
                                                    height: 40,
                                                  ),
                                                  // Text(
                                                  //   "Tiếp tục Google",
                                                  //   style: TextStyle(
                                                  //     fontSize: 20.0,
                                                  //     fontWeight: FontWeight.w700,
                                                  //     color: Color(0xff1877f2),
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Positioned.fill(
                                  //   top: 20,
                                  //   child: Align(
                                  //     alignment: Alignment.topCenter,
                                  //     child: CircleAvatar(
                                  //       radius: 50.0,
                                  //       backgroundImage: Svg(iconLogin),
                                  //       backgroundColor: Colors.grey.shade400,
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
