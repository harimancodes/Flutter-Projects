import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData darkTheme() {
    return ThemeData(
      backgroundColor: Colors.grey.shade800,
      errorColor: Colors.red,
      scaffoldBackgroundColor: Colors.grey.shade900,
      secondaryHeaderColor: Colors.white30,
      primarySwatch: Colors.blue,
      fontFamily: 'QuickSand',
      textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
            headline5: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
      appBarTheme: AppBarTheme(
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
      ),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      backgroundColor: Colors.white,
      errorColor: Colors.red,
      primaryColor: Colors.blue,
      primarySwatch: Colors.blue,
      secondaryHeaderColor: Colors.blue,
      fontFamily: 'QuickSand',
      textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
      appBarTheme: AppBarTheme(
        color: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}
