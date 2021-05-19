import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email, _password, _rePassword;

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
          SizedBox(
            height: 10,
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
           SizedBox(
            height: 10,
          ),
          TextField(
            onChanged: (val) {
              _rePassword = val.toString();
            },
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              labelText: "Re-type password",
            ),
          ),
        ],
      ),
    );
  }
}
