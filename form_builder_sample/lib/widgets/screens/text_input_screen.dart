import 'package:flutter/material.dart';
import 'package:formbuilder/formbuilder.dart';

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

  QuestionNavigation _questionNavigation;

  @override
  Widget build(BuildContext context) {
    _questionNavigation = FormBuilderProvider.navigatorOf(context);
    return FormBuilderNotifier(
      builder: (metadata) {
        var textInputMeta = _questionNavigation.getTextInputMeta();
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
                  _questionNavigation.submitAnswer(inputText);
                },
              )
            ],
          ),
        );
      },
    );
  }

  void initializeScreen() {
    inputText = _questionNavigation.getCurrentData();
  }
}
