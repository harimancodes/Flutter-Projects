import 'package:dib_app/mobile_login_screen.dart';
import 'package:dib_app/registration_screen.dart';
import 'package:flutter/material.dart';

enum ChosenLogin { LOGIN_WITH_EMAIL, LOGIN_WITH_MOBILE }

class RegistrationLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrationLoginState();
}

class _RegistrationLoginState extends State<RegistrationLogin> {
  
  ChosenLogin _chosenLogin;
  List<Widget> _widgetOptions = <Widget>[
    RegistrationScreen(),
    MobileLoginScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: Center(
                    child: Text(
                      'DIB',
                      style: TextStyle(
                        fontSize: 100.0,
                        fontFamily: 'Horizon',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.elliptical(500, 80),
                      bottomRight: const Radius.elliptical(500, 80),
                    ),
                  ),
                ),
              ),
              _chosenLogin == null
                  ? _regLogChooser()
                  : (_chosenLogin == ChosenLogin.LOGIN_WITH_EMAIL
                      ? _widgetOptions[0]
                      : _widgetOptions[1]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton(String text) {
    return Center(
      child: Container(
        height: 40.0,
        width: 280.0,
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (text == 'Login with Mobile')
                _chosenLogin = ChosenLogin.LOGIN_WITH_MOBILE;
              else if (text == 'Login with Email')
                _chosenLogin = ChosenLogin.LOGIN_WITH_EMAIL;
            });
            print(_chosenLogin.toString());
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

  Widget _regLogChooser() {
    return Container(
      padding: EdgeInsets.only(top: 420, right: 30, left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          _loginButton('Login with Mobile'),
          SizedBox(
            height: 20,
          ),
          _loginButton('Login with Email'),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: TextStyle(color: Colors.black),
              ),
              TextButton(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
