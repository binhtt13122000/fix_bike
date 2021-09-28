import 'package:fix_bike/components/TextFieldPrefIcon.dart';
import 'package:fix_bike/controller/AuthenticationController.dart';
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
                              padding:
                              EdgeInsets.fromLTRB(10, 0, 10, 70),
                              child: Container(
                                padding:
                                EdgeInsets.fromLTRB(10, 50, 10, 50),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 11.5),
                                    Container(
                                      child: Text(
                                        'Helper Repair',
                                        style: TextStyle(
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30.0),
                                    TextFieldInput(
                                      labelText: 'Email',
                                      validator: (val) => val!.isEmpty
                                          ? "Email không được để trống"
                                          : null,
                                      icon: Icons.email_outlined,
                                      textInputType: TextInputType.emailAddress,
                                    ),
                                    SizedBox(height: 10.0),
                                    TextFieldInput(
                                      labelText: 'Mật khẩu',
                                      validator: (val) => val!.isEmpty
                                          ? "Mật khẩu không được để trống"
                                          : null,
                                      icon: Icons.vpn_key,
                                      isVisibleText: false,
                                    ),
                                    SizedBox(height: 10.0),
                                    ElevatedButton(
                                      onPressed: () {
                                        controller
                                            .authenticationWithGoogle(
                                            context);
                                      },
                                      style: ButtonStyle(
                                        elevation:
                                        MaterialStateProperty.all(4),
                                        backgroundColor:
                                        MaterialStateProperty
                                            .resolveWith<Color>((Set<
                                            MaterialState>
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
                                            image: AssetImage(iconGoogle),
                                            height: 32,
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            "Tiếp tục Google",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff1877f2),
                                            ),
                                          ),
                                        ],
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
