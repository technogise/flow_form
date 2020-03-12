import 'package:flutter/material.dart';

import '../../styles/common.dart';

///Class for reusable square button component
class SquareButton extends StatelessWidget {
  ///variable to store button text
  final String label;

  ///variable to store onPressed function
  final Function onPressed;

  ///variable to store is button pressed
  final bool isPressed;

  ///Constructor
  SquareButton({
    @required this.label,
    @required this.onPressed,
    this.isPressed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: RaisedButton(
        color: isPressed ? Colors.purple.shade300 : Colors.white,
        textColor: Colors.white,
        child: Text(
          label,
          style: isPressed
              ? AppText.pressedButtonText
              : AppText.unPressedButtonText,
        ),
        onPressed: () {
          onPressed(label);
        },
      ),
    );
  }
}
