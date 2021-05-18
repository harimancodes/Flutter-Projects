import 'package:flutter/material.dart';

class RegistrationLoginScreen extends StatelessWidget {
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
              Container(
                padding: EdgeInsets.only(top: 420, right: 30, left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 40.0,
                      width: 280.0,
                      child: GestureDetector(
                        onTap: () {
                          // widget.user = new User(phNUm:widget._phoneNumber);
                          // print("User phone number : ${user.number}");
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => (){}));
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
