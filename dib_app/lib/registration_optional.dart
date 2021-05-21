import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'registration_screen.dart';

class RegOptionalScreen extends StatefulWidget {
  final _chosenReg;
  String _email, _password;
  RegOptionalScreen(this._chosenReg, this._email, this._password);
  @override
  State<StatefulWidget> createState() => _RegOptionalScreenState();
}

class _RegOptionalScreenState extends State<RegOptionalScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String _shopName, _mobNum, _otp, _verifictaionId;
  int _resendingToken;
  bool _isMobNumEntered = false;
  bool _showLoading = false, _isCodeSent = false, _isVerified = false;
  bool _isCorrectOtp = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return widget._chosenReg == ChosenReg.REG_AS_OWNER
        ? _regAsOwner()
        : _regAsIndividual();
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

  Widget _showOtpField() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          child: TextField(
            maxLength: 6,
            style: TextStyle(letterSpacing: 9.0),
            onChanged: (val) {
              _otp = val.toString();
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                counterText: '',
                isDense: true,
                labelText: "OTP",
                errorText: _isCorrectOtp ? null : "Wrong OTP!",
                errorStyle: TextStyle(color: Colors.red),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                labelStyle: TextStyle(letterSpacing: 2.0)),
          ),
        ),
        TextButton(
          child: _isVerified
              ? Text(
                  'Verified',
                  style: TextStyle(color: Colors.green),
                )
              : Text(
                  'Verify',
                  style: TextStyle(color: Colors.blue),
                ),
          onPressed: () async {
            setState(() {
              _showLoading = true;
            });
            print("Otp : ${_otp}");

            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: _verifictaionId, smsCode: _otp);


            print('Phone Auth Crednetial : ${phoneAuthCredential.toString()}');
            // try {
            //   final authResult =
            //       await _auth.signInWithCredential(phoneAuthCredential);
            //   if (authResult?.user != null) {
            //     setState(() {
            //       _isCorrectOtp = true;
            //       _isVerified = true;
            //     });
            //   }
            // } catch (error) {
            //   setState(() {
            //     _isCorrectOtp = false;
            //   });
            // }

            //  if (_auth.currentUser.phoneNumber != null) _isVerified = true;
          },
        ),
        if (_showLoading == true)
          Center(
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }

  Widget _regAsOwner() {
    return Container(
      padding: EdgeInsets.only(top: 440, right: 30, left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            onChanged: (val) {
              // _email = val.toString();
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Shop Name",
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 0, right: 40),
            leading: Container(
              width: MediaQuery.of(context).size.width * 0.55,
              child: TextField(
                maxLength: 10,
                onChanged: (val) {
                  _mobNum = "+91" + val.toString();
                  if (_mobNum.length == 13)
                    setState(() {
                      _isMobNumEntered = true;
                    });
                  else
                    setState(() {
                      _isMobNumEntered = false;
                    });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  counterText: '',
                  labelText: "Mobile Number",
                ),
              ),
            ),
            trailing: TextButton(
              style: TextButton.styleFrom(
                onSurface: Colors.blue,
              ), //Tex
              child: Text(
                'Get OTP',
              ),

              onPressed: _isMobNumEntered ? _verify : null,
            ),
          ),
          _showOtpField(),
          SizedBox(height: 20),
          _regButton("Submit"),
        ],
      ),
    );
  }

  Widget _regAsIndividual() {
    return null;
  }

  void _verify() async {
    print('Phone number : ${_mobNum}');
    setState(() {
      _showLoading = true;
    });
    await _auth.verifyPhoneNumber(
      phoneNumber: _mobNum,
      verificationCompleted: (phoneAuthCredential) async {
        setState(() {
          _showLoading = false;
        });
      },
      verificationFailed: (phoneVerificationFailed) async {
        setState(() {
          _showLoading = false;
        });
        // _scaffoldKey.currentState.showSnackBar(
        //   //SnackBar(content: Text(phoneVerificationFailed.message)),
        // );
      },
      codeSent: (verificationId, resendingToken) async {
        setState(() {
          _isCodeSent = true;
          _showLoading = false;
          this._resendingToken = resendingToken;
          this._verifictaionId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
  }
}
