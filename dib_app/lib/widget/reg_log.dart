import 'package:dib_app/mobile_login_screen.dart';
import 'package:dib_app/registration_screen.dart';
import 'package:dib_app/widget/login_email.dart';
import 'package:flutter/material.dart';

enum ChosenOption { LOGIN_WITH_EMAIL, LOGIN_WITH_MOBILE, SIGHN_UP }

class RegistrationLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegistrationLoginState();
}

class _RegistrationLoginState extends State<RegistrationLogin> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ChosenOption _chosenOption;
  List<Widget> _widgetOptions = <Widget>[
    LoginEmail(),
    MobileLoginScreen(),
    RegistrationScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: WillPopScope(
        onWillPop: () {
          setState(() {
            _chosenOption = null;
          });
        },
        child: Scaffold(
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
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
                _chosenOption == null
                    ? _regLogChooser()
                    : (_chosenOption == ChosenOption.LOGIN_WITH_EMAIL
                        ? _widgetOptions[0]
                        : (_chosenOption == ChosenOption.LOGIN_WITH_MOBILE)
                            ? _widgetOptions[1]
                            : _widgetOptions[2]),
              ],
            ),
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
                _chosenOption = ChosenOption.LOGIN_WITH_MOBILE;
              else if (text == 'Login with Email')
                _chosenOption = ChosenOption.LOGIN_WITH_EMAIL;
            });
            print(_chosenOption.toString());
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
      padding: EdgeInsets.only(top: 460, right: 30, left: 30),
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
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              TextButton(
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _chosenOption = ChosenOption.SIGHN_UP;
                  });
                },
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
