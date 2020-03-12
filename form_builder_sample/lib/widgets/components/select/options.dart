import 'package:flutter/material.dart';

import '../buttons/rounded_button.dart';

///Class for reusable Options component
class Options extends StatelessWidget {
  ///Variable to hold the select type
  static const type = 'single-select';

  ///variable to store list of options
  final List options;

  ///variable to store onPressed function
  final Function(String label) onPressed;

  ///variable to store selected Value
  final String selectedValue;

  ///Constructor
  Options({
    @required this.options,
    @required this.onPressed,
    this.selectedValue,
  });

  List<Widget> _buildButtonsArray() {
    return options.map((option) {
      return RoundedButton(
        label: option,
        onPressed: onPressed,
        isPressed: option == selectedValue,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildButtonsArray(),
    );
  }
}
