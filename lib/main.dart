import 'package:fix_bike/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        // '/about': (context) => About(),
        // '/settings': (context) => Settings(),
      },
    );
  }
}
