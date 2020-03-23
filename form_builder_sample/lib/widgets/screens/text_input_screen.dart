import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/helpers/database.dart';
import 'package:formbuilder/redux/app_state.dart';
import 'package:formbuilder/redux/models/store_view_model.dart';

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
    return StoreConnector<AppState, StoreViewModel>(
      converter: StoreViewModel.fromStore,
      builder: (context, viewModel) {
        var textInputMeta = viewModel.getTextInput();
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
              ),
              SubmitButton(
                active: true,
                label: textInputMeta.buttonText,
                onPressed: (label) {
                  Database.saveData(viewModel: viewModel, answer: inputText);
                  viewModel.goToNextQuestion();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
