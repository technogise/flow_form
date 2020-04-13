import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import 'rounded_button.dart';

///Submit button Widget
class SubmitButton extends StatelessWidget {
  ///Variable to store label for the button
  final String label;

  ///Variable to denote if the button is active
  final bool active;

  ///Variable to denote if the button is inactive
  final Null Function(String) onPressed;

  ///Constructor to initialise the submit button
  SubmitButton({this.active = false, this.onPressed, this.label = "Submit"});

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      label: label,
      color: active ? kActiveButtonColor : kInactiveButtonColor,
      onPressed: active ? onPressed : null,
    );
  }
}
