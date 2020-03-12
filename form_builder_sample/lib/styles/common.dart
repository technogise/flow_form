import 'package:flutter/material.dart';

///Class for Text styles
class AppText {
  ///variable to store comment text style
  static const TextStyle commentText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  ///variable to store question text style
  static const TextStyle questionText = TextStyle(fontSize: 20);

  ///variable to store button text style
  static const TextStyle pressedButtonText =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  ///variable to store button text style
  static const TextStyle unPressedButtonText =
      TextStyle(color: Colors.purple, fontWeight: FontWeight.bold);
}

///Class for Containers
class AppContainer {
  ///variable to store box constraints
  static const BoxConstraints questionCard = BoxConstraints(minHeight: 50);
}
