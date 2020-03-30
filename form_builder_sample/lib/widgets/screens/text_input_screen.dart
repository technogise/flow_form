import 'package:flutter/material.dart';
import 'package:flow_form/flow_form.dart';

import '../components/buttons/submit_button.dart';
import '../components/text_input.dart';

///Class for reusable Text input component
class TextInputScreen extends StatefulWidget {
  /// Static variable to refer this class in routes
  static const String type = 'text-input';

  /// Constructor
  TextInputScreen({Key key}) : super(key: key);

  @override
  _TextInputScreenState createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  String inputText;

  @override
  Widget build(BuildContext context) {
    final questionNavigation = FlowFormProvider.navigatorOf(context);
    var textInputMeta = questionNavigation.getTextInputMeta();
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextInput(
            hintText: textInputMeta.hintText,
            onChange: (value) {
              setState(() {
                inputText = value;
              });
            },
            initialValue: inputText,
          ),
          SubmitButton(
            active: true,
            label: textInputMeta.buttonText,
            onPressed: (label) {
              questionNavigation.submitAnswer(inputText);
            },
          )
        ],
      ),
    );
  }
}
