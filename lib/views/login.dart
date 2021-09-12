import 'package:firebase_auth/firebase_auth.dart';
import 'package:fix_bike/services/auth.dart';
import 'package:fix_bike/styles/my_icons.dart';
import 'package:fix_bike/views/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    if(_auth.currentUser != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
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
        child: SingleChildScrollView(
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
                  padding: EdgeInsets.fromLTRB(10, 24, 10, 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffe1e2e3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      TextFieldInput(
                        labelText: 'Username',
                        validator: (val) => val!.isEmpty ? "Username is not null" : null,
                        icon: Icons.verified_user_outlined,
                        textEditingController: textUsernameController,
                        textInputType: TextInputType.emailAddress,
                        isErrorField: isErrorUsername,
                      ),
                      SizedBox(height: 15.0),
                      TextFieldInput(
                        labelText: 'Password',
                        validator: (val) => val!.isEmpty ? "Password is not null" : null,
                        icon: Icons.vpn_key,
                        textEditingController: textPasswordController,
                        isVisibleText: false,
                        isErrorField: isErrorPassword,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.0),
                Padding(
                  padding: EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Color(0xff1877f2),
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xff1877f2),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
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
                        textButton: "Sign In",
                        imageUrl: "",
                        textStyle: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        borderRadius: 24,
                        edgeInsets: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                        handleFunction: () {
                          if(_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            setState(() {
                              isErrorUsername = false;
                              isErrorPassword = false;
                            });
                            AuthMethods().signInWithUsernameAndPassword(context, textUsernameController.value.text, textPasswordController.value.text);
                          }else {
                            setState(() {
                              isErrorUsername = textUsernameController.value.text != "" ? false : true;
                              isErrorPassword = textPasswordController.value.text != "" ? false : true;
                            });
                          }
                        },
                      ),
                      SizedBox(
                        height: 14.0,
                      ),
                      ButtonCustom(
                        bgColor: Color(0xfff5f8fd),
                        bgColorPress: Colors.white70,
                        textButton: "Sign In With",
                        textStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff1877f2),
                        ),
                        handleFunction: () {
                          AuthMethods().signInWithGoogle(context);
                        },
                        imageUrl: iconGoogle,
                        borderRadius: 24,
                        edgeInsets: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 10.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonCustom extends StatelessWidget {
  ButtonCustom(
      {required this.bgColor,
      required this.bgColorPress,
      required this.textButton,
      this.imageUrl = "",
      this.handleFunction,
      required this.textStyle,
      required this.borderRadius,
      required this.edgeInsets});
  Color bgColor, bgColorPress;
  double borderRadius;
  EdgeInsets edgeInsets;
  String textButton, imageUrl;
  TextStyle textStyle;
  Function? handleFunction;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        handleFunction!();
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(4),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) return bgColorPress;
          return bgColor; // Defer to the widget's default.
        }),
        padding: MaterialStateProperty.all<EdgeInsets>(edgeInsets),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        )),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textButton,
            style: textStyle,
          ),
          if (imageUrl != "")
            SizedBox(
              width: 4,
            ),
          if (imageUrl != "")
            Image(
              image: AssetImage(imageUrl),
              height: 24,
            ),
        ],
      ),
    );
  }
}

class TextFieldInput extends StatelessWidget {
  TextFieldInput({required this.labelText, required this.icon, this.textEditingController, this.textInputType, this.isVisibleText = true, this.validator, this.isErrorField = false});
  String labelText;
  IconData icon;
  TextEditingController? textEditingController;
  TextInputType? textInputType;
  bool isVisibleText;
  bool? isErrorField;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: TextFormField(
        validator: validator,
        textAlignVertical: TextAlignVertical.center,
        controller: textEditingController,
        keyboardType: textInputType,
        obscureText: !isVisibleText,
        enableSuggestions: isVisibleText,
        autocorrect: isVisibleText,
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(
              icon,
              color: (isErrorField != null && isErrorField!) ? Colors.redAccent : Colors.lightBlueAccent.shade400,
            )),
      ),
    );
  }
}
