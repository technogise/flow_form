import 'package:flutter/material.dart';

///Widget to represent the datefield of the datepicker
class DateField extends StatelessWidget {
  ///Variable to hold the hint text
  final String hintText;

  ///Variable to hold the current field's focus node
  final FocusNode focusNode;

  ///Variable to hold the focus node for previous field
  final FocusNode prevNode;

  ///Variable to hold the focus node for next field
  final FocusNode nextNode;

  ///OnChange callback
  final void Function(String) onChange;

  ///Max Length of the field
  final int maxLength;

  final _decoration = InputDecoration(
    counterText: '',
    hintStyle: TextStyle(color: Colors.grey[300]),
    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    border: OutlineInputBorder(borderSide: BorderSide.none),
  );

  ///Constructor to get datefield
  DateField(
    this.hintText, {
    @required this.maxLength,
    @required this.focusNode,
    @required this.prevNode,
    @required this.nextNode,
    @required this.onChange,
  });

  void _moveToPreviousNode(BuildContext context) {
    if (prevNode == null) {
      return;
    }
    FocusScope.of(context).requestFocus(prevNode);
  }

  void _moveToNextNode(BuildContext context) {
    if (nextNode == null) {
      return;
    }

    FocusScope.of(context).requestFocus(nextNode);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        autofocus: true,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
        maxLength: maxLength,
        maxLengthEnforced: true,
        decoration: _decoration.copyWith(hintText: hintText),
        onChanged: (String value) {
          if (value.length == 0) _moveToPreviousNode(context);
          if (value.length == maxLength) _moveToNextNode(context);
          onChange(value);
        });
  }
}
