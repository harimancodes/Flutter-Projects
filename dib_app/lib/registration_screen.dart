import 'package:dib_app/registration_optional.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum ChosenReg { REG_AS_OWNER, Reg_AS_INDIVIDUAL }

class RegistrationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String _email, _password;
  ChosenReg _chosenReg;

  @override
  Widget build(BuildContext context) {
    return _chosenReg == null
        ? _regChooserForm()
        : _regOPtionalForm(_chosenReg,_email,_password);
  }

  Widget _regButton(String text) {
    return Center(
      child: Container(
        height: 40.0,
        width: 260.0,
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (text == "Register as Owner")
                _chosenReg = ChosenReg.REG_AS_OWNER;
              else if (text == 'Register as an Individual')
                _chosenReg = ChosenReg.Reg_AS_INDIVIDUAL;
            });
          },
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

  Widget _regChooserForm() {
    return Container(
      padding: EdgeInsets.only(top: 460, right: 30, left: 30),
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
          SizedBox(height: 25),
          _regButton("Register as Owner"),
          SizedBox(height: 10),
          _regButton('Register as an Individual'),
        ],
      ),
    );
  }

  Widget _regOPtionalForm(ChosenReg chosenReg,String email,String password) {
    return RegOptionalScreen(chosenReg,email,password);
  }
}
