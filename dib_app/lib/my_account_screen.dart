import 'package:dib_app/mobile_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'model/user_model.dart';

class MyAccountScreen extends StatefulWidget {
  final UserModel user;
  MyAccountScreen(this.user);
  @override
  State<StatefulWidget> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Row(
            children: [
              Text('phone : ${widget.user.phNum}'),
              TextButton(
                  onPressed: () async {
                    await _auth.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MobileLoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Signout',
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
