import 'package:flutter/material.dart';

import 'colors.dart';

///Theme Data for the app
final ThemeData appTheme = ThemeData(
  canvasColor: Colors.white,
  cursorColor: Colors.grey[400],
  inputDecorationTheme: inputTheme,
  buttonTheme: ButtonThemeData(
      buttonColor: Colors.purple[300], disabledColor: kInactiveButtonColor),
);

///Input field decorations for the app
final InputDecorationTheme inputTheme = InputDecorationTheme(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);
