import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.blue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.amber,
      ),
    ),
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.blue,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.brown,
      ),
    ),
  );
}
