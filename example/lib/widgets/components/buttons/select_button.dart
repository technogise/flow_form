import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import 'rounded_button.dart';

///Class for reusable Rounded button
class SelectButton extends StatelessWidget {
  ///variable to store onPressed function
  final Function onPressed;

  ///variable to store text label
  final String label;

  ///Variable to determine if the button is active or not
  final bool active;

  ///Constructor
  SelectButton({this.onPressed, this.label, this.active});

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      onPressed: onPressed,
      label: label,
      color: active ? kSelectedButtonColor : kNonSelectedButtonColor,
    );
  }
}
