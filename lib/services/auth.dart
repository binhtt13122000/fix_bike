import 'package:firebase_auth/firebase_auth.dart';
import 'package:fix_bike/services/database.dart';
import 'package:fix_bike/views/home.dart';
import 'package:fix_bike/views/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  signInWithUsernameAndPassword(
      BuildContext context, String userName, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userName, password: password);
      if(userCredential.user != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, "Wrong username or password provided for that user.");
      }
    }
  }

  signInWithGoogle(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount == null) return;
    GoogleSignInAccount? user = googleSignInAccount;
    final googleAuth = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    UserCredential result = await auth.signInWithCredential(credential);

    User? userDetails = result.user;

    if (userDetails != null) {

      Map<String, dynamic> userInfoMap = {
        "email": userDetails.email,
        "username": userDetails.email!.replaceAll("@gmail.com", ""),
        "name": userDetails.displayName,
        "imgUrl": userDetails.photoURL,
      };
      DatabaseMethods()
          .addUserInfoToDB(userDetails.uid, userInfoMap)
          .then((value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    }
  }

  signOut(BuildContext context) async {
    await auth.signOut();
    GoogleSignIn().disconnect();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => LoginPage()));
  }
}

showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        fontSize: 18,
      ),
    ),
    backgroundColor: Colors.redAccent,
    duration: Duration(seconds: 5),
    behavior: SnackBarBehavior.fixed,
    elevation: 0,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
