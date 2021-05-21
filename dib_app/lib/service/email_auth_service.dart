import 'package:dib_app/model/user_model.dart';
import 'package:dib_app/my_account_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailAuthService {
  UserModel userModel;
  FirebaseAuth _auth = FirebaseAuth.instance;
  void _registerAccount(
      BuildContext context, String email, String password) async {
    final User user = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;

    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      await user.updateProfile(displayName: email);
      // final myUser = _auth.currentUser;
      userModel = new UserModel(email: email);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyAccountScreen(userModel),
        ),
      );
    }
  }
}
