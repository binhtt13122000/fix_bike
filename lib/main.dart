import 'package:firebase_core/firebase_core.dart';
import 'package:fix_bike/screens/home.dart';
// import 'package:fix_bike/screens/repairman/login_screen.dart';
import 'package:fix_bike/screens/user/LoginScreen.dart';

import 'package:fix_bike/screens/NotificationScreen.dart';
import 'package:fix_bike/screens/ProfileScreen.dart';
import 'package:fix_bike/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Home(),
    );
  }
}
