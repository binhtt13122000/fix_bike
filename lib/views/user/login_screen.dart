import 'package:fix_bike/services/auth.dart';
import 'package:fix_bike/styles/my_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fix_bike/views/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  checkAuthentication() async {
    if (_auth.currentUser != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 70, 10, 70),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
                    decoration: BoxDecoration(
                      color: Color(0xffe1e2e3),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 15.0),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          child: Text(
                            'Đăng Nhập',
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(height: 45.0),
                        ElevatedButton(
                          onPressed: () {
                            AuthMethods().signInWithGoogle(context);
                          },
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(4),
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) return Colors.white70;
                                  return Color(0xfff5f8fd); // Defer to the widget's default.
                                }),
                            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(iconGoogle),
                                height: 24,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Continue with Google",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff1877f2),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 45.0),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 20,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: CircleAvatar(
                      // radius: 18.0,
                      radius: 50.0,
                      backgroundImage: Svg(iconLogin),
                      backgroundColor: Colors.grey.shade400,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}