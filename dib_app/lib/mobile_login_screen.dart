import 'package:dib_app/my_account_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'model/user_model.dart';

class MobileLoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  UserModel user;
  String _phoneNumber = '', _otp = '', _verifictaionId;
  bool _isCodeSent = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _showLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 420, right: 30, left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            onChanged: (val) {
              _phoneNumber = "+91" + val.toString();
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Your phone number",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          if (_isCodeSent == false)
            TextButton(
              onPressed: _verify,
              child: Text(
                'Verify',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          if (_isCodeSent == true) _showOtpField(),
          if (_isCodeSent == true)
            if (_showLoading == true)
              Center(
                child: CircularProgressIndicator(),
              ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 40.0,
            width: 280.0,
            child: GestureDetector(
              onTap: () async {
                PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: _verifictaionId, smsCode: _otp);
                _loiginWithPhoneAuth(phoneAuthCredential);
              },
              child: Material(
                borderRadius: BorderRadius.circular(20),
                shadowColor: Colors.blueAccent,
                color: Colors.blue,
                elevation: 7.0,
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _showOtpField() {
    return TextField(
      onChanged: (val) {
        _otp = val.toString();
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "OTP",
      ),
    );
  }

  void _verify() async {
    print('Phone number : ${_phoneNumber}');
    setState(() {
      _showLoading = true;
    });
    await _auth.verifyPhoneNumber(
      phoneNumber: _phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        setState(() {
          _showLoading = false;
        });
      },
      verificationFailed: (phoneVerificationFailed) async {
        setState(() {
          _showLoading = false;
        });
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(content: Text(phoneVerificationFailed.message)),
        );
      },
      codeSent: (verificationId, resendingToken) async {
        setState(() {
          _isCodeSent = true;
          _showLoading = false;
          this._verifictaionId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }

  void _loiginWithPhoneAuth(PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      _showLoading = true;
    });
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        _showLoading = false;
      });
      if (authCredential?.user != null) {
        user = new UserModel(phNum: _phoneNumber);
        print("User phone number : ${user.phNum}");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MyAccountScreen(user)));
      }
    } on FirebaseAuthException catch (exception) {
      setState(() {
        _showLoading = true;
      });
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(exception.message)),
      );
    }
  }
}
