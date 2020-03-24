import 'package:flutter/material.dart';

import 'square_buttons.dart';

///Class for reusable Options component
class Options extends StatelessWidget {
  ///variable to store list of options
  final List options;

  ///variable to store onPressed function
  final Function onPressed;

  ///variable to store selected Options
  final String selectedOptions;

  ///Constructor
  Options({
    @required this.options,
    @required this.onPressed,
    this.selectedOptions,
  });

  @override
  Widget build(BuildContext context) {
    //TODO: Should option from a list
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(flex: 4, child: SizedBox()),
          Expanded(
            flex: 3,
            child: SquareButton(
              label: options[0],
              onPressed: onPressed,
              isPressed: options[0] == selectedOptions,
            ),
          ),
          Expanded(
            flex: 3,
            child: SquareButton(
              label: options[1],
              onPressed: onPressed,
              isPressed: options[1] == selectedOptions,
            ),
          ),
        ],
      ),
    );
  }
}
