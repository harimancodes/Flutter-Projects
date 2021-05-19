import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginEmail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 420, right: 30, left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            onChanged: (val) {
              _email = val.toString();
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
            ),
          ),
          TextField(
            onChanged: (val) {
              _password = val.toString();
            },
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              labelText: "New password",
            ),
          ),
          SizedBox(height: 20),
          _regButton("Login"),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _regButton(String text) {
    return Center(
      child: Container(
        height: 40.0,
        width: 260.0,
        child: GestureDetector(
          onTap: () {},
          child: Material(
            borderRadius: BorderRadius.circular(20),
            shadowColor: Colors.blueAccent,
            color: Colors.blue,
            elevation: 7.0,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
