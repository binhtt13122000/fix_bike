import 'package:firebase_core/firebase_core.dart';
import 'package:fix_bike/views/login.dart';
import 'package:flutter/material.dart';
import 'styles/my_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: LoginPage(),
    );
  }
}
