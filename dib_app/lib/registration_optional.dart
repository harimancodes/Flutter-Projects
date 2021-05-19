import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'registration_screen.dart';

class RegOptionalScreen extends StatefulWidget {
  final _chosenReg;
  RegOptionalScreen(this._chosenReg);
  @override
  State<StatefulWidget> createState() => _RegOptionalScreenState();
}

class _RegOptionalScreenState extends State<RegOptionalScreen> {
  String _shopName, _mobNum, _otp;
  bool _isMobNumEntered = false;
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
                labelStyle: TextStyle(letterSpacing: 2.0)),
          ),
        ),
        TextButton(
          child: Text(
            'Verify',
            style: TextStyle(color: Colors.blue),
          ),
          onPressed: () {},
        )
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
            contentPadding: EdgeInsets.only(left: 0),
            leading: Container(
              child: TextField(
                maxLength: 10,
                onChanged: (val) {
                  _mobNum = val.toString();
                  if (_mobNum.length == 10)
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
              onPressed: _isMobNumEntered ? () {} : null,
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
}
