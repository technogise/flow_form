import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../../styles/common.dart';

///Class for reusable Rounded button
class RoundedButton extends StatelessWidget {
  ///variable to store onPressed function
  final Function onPressed;

  ///variable to store text label
  final String label;

  ///variable to store button color
  final Color color;

  ///variable to store isPressed
  final bool isPressed;

  ///Constructor
  RoundedButton({
    this.onPressed,
    this.label,
    this.color,
    this.isPressed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color ?? kSelectedButtonColor,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed != null
              ? () {
                  onPressed(label);
                }
              : null,
          onLongPress: null,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            label,
            key: ValueKey(label),
            style: isPressed
                ? AppText.pressedButtonText
                : AppText.unPressedButtonText,
          ),
        ),
      ),
    );
  }
}
