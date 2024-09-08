import 'package:flutter/material.dart';

class CustomTheme {
  static final lightTheme = ThemeData(
      fontFamily: "poppins",
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.grey[900],
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.white,
      ));
  static final darkTheme = ThemeData(
      fontFamily: "poppins",
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.black,
      ));
}
