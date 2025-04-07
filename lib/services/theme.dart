import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.grey[50],
  primaryColor: Colors.blueGrey[700],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blueGrey[700],
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: IconThemeData(color: Colors.blueGrey),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.black),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.grey[900],
  primaryColor: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: IconThemeData(color: Colors.white),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
  ),
);
