import 'package:flutter/material.dart';
import '../styles/common.dart';

///Class for reusable square button component
class SquareBox extends StatelessWidget {
  ///variable to store button text
  final String label;

  ///variable to store onPressed function
  final Function onPressed;

  ///Constructor
  SquareBox({@required this.label, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 150.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: RaisedButton(
          color: Colors.teal[300],
          textColor: Colors.white,
          child: Text(
            label,
            style: AppText.pressedButtonText,
          ),
          onPressed: () {
            onPressed(label);
          },
        ),
      ),
    );
  }
}
