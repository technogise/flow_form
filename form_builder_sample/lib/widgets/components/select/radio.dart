import 'package:flutter/material.dart';

import '../buttons/rounded_button.dart';

///Class for reusable RadioButtons widget
class RadioButtons extends StatefulWidget {
  ///Variable to hold the select type
  static const type = 'single-radio-select';

  ///variable to store list of options
  final List options;

  ///variable to store onPressed function
  final Function(String label) onPressed;

  ///
  final String selectedValue;

  ///Constructor
  RadioButtons({
    @required this.options,
    this.selectedValue,
    @required this.onPressed,
  });

  @override
  _RadioButtonsState createState() =>
      _RadioButtonsState(options, selectedValue);
}

class _RadioButtonsState extends State<RadioButtons> {
  String selectedValue;

  _RadioButtonsState(List options, dynamic initialValue) {
    print(initialValue);
    selectedValue = initialValue ?? options.first;
    print(selectedValue);
  }

  List<Widget> _buildButtonsArray() {
    return widget.options.map((option) {
      return ListTile(
          leading: Radio<String>(
            value: option,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
          title: Text(option));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ..._buildButtonsArray(),
          RoundedButton(
            label: "Submit",
            onPressed: (label) {
              widget.onPressed(selectedValue);
            },
          ),
        ]);
  }
}
