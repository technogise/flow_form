import 'package:flutter/material.dart';

import '../buttons/select_button.dart';
import '../buttons/submit_button.dart';

///Class for reusable MultiSelectOptions widget
class MultiSelectOptions extends StatefulWidget {
  ///Variable to hold the select type
  static const type = 'multi-select-options';

  ///variable to store list of options
  final List options;

  ///variable to store onPressed function
  final Function(List<String> label) onPressed;

  ///Constructor
  MultiSelectOptions({@required this.options, @required this.onPressed});

  @override
  _MultiSelectOptionsState createState() => _MultiSelectOptionsState();
}

class _MultiSelectOptionsState extends State<MultiSelectOptions> {
  List<String> selectedValues = [];

  _MultiSelectOptionsState();

  List _updateSelectedValue(String value) {
    if (selectedValues.contains(value)) {
      selectedValues.remove(value);
    } else {
      selectedValues.add(value);
    }
    return selectedValues;
  }

  List<Widget> _buildButtonsArray() {
    return widget.options.map((option) {
      return SelectButton(
          active: selectedValues.contains(option),
          label: option,
          onPressed: (value) {
            setState(() {
              selectedValues = _updateSelectedValue(value);
            });
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ..._buildButtonsArray(),
          SubmitButton(
            active: selectedValues.isNotEmpty,
            onPressed: (label) {
              widget.onPressed(selectedValues);
            },
          )
        ]);
  }
}
