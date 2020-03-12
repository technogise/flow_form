import 'package:flutter/material.dart';

///Class for reusable text input component
class TextInput extends StatelessWidget {
  ///variable to store onChange function
  final Function onChange;

  ///variable to store text label
  final String hintText;

  ///variable to is input value obscured
  final bool obscureText;

  ///variable to store text input type
  final TextInputType inputType;

  ///variable to store initial value
  final String initialValue;

  ///Constructor
  TextInput({
    this.onChange,
    this.hintText,
    this.obscureText = false,
    this.inputType = TextInputType.text,
    this.initialValue = "",
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
//ToDo: Sandal look into how to incorporate text editing controller
//      controller: TextEditingController(text: initialValue),
      textAlign: TextAlign.center,
      onChanged: onChange,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
