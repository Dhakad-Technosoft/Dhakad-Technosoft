import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: Colors.black,
    primaryColorDark: Colors.black,
    accentColor: Colors.black,

    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.white),

    iconTheme: IconThemeData(color: Colors.black),
    buttonColor: Colors.black,

    //Theming for text
    textTheme: TextTheme(
      headline5: TextStyle(fontFamily: "BalsamiqSans"),
      headline4: TextStyle(fontFamily: "AbrilFatface"),
      headline3: TextStyle(fontFamily: "AbrilFatface"),
      headline2: TextStyle(fontFamily: "AbrilFatface"),
      headline1: TextStyle(fontFamily: "AbrilFatface"),
      headline6: TextStyle(fontFamily: "BalsamiqSans"),
      subtitle1: TextStyle(fontFamily: "BalsamiqSans"),
      button: TextStyle(fontFamily: "BalsamiqSans"),
      caption: TextStyle(fontFamily: "BalsamiqSans"),
      bodyText2: TextStyle(fontFamily: "BalsamiqSans"),
      bodyText1: TextStyle(fontFamily: "BalsamiqSans"),
    ),
  );
}
