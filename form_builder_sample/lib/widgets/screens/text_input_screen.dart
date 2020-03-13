import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/redux/app_state.dart';
import 'package:formbuilder/redux/models/store_view_model.dart';
import 'package:redux/redux.dart';

import '../components/buttons/submit_button.dart';
import '../components/text_input.dart';

///Class for reusable Text input component
class TextInputScreen extends StatefulWidget {
  /// Static variable to refer this class in routes
  static const String type = 'text-input';

  final String text;

  /// Constructor
  TextInputScreen({Key key, this.text}) : super(key: key);

  @override
  _TextInputScreenState createState() => _TextInputScreenState(inputText: text);
}

class _TextInputScreenState extends State<TextInputScreen> {
  String inputText;

  _TextInputScreenState({this.inputText = ''});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StoreViewModel>(
      onInit: initializeScreen,
      converter: StoreViewModel.fromStore,
      builder: (context, viewModel) {
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextInput(
                hintText: viewModel.getScreenData("hint"),
                onChange: (value) {
                  setState(() {
                    inputText = value;
                  });
                },
                initialValue: inputText,
              ),
              SubmitButton(
                active: true,
                label: viewModel.getScreenData("buttonText"),
                onPressed: (label) {
                  saveData(viewModel);
                },
              )
            ],
          ),
        );
      },
    );
  }

  void initializeScreen(Store<AppState> store) {
    var currentNode = store.state.currentNode;
    inputText = store.state.userResponse.get(currentNode.dataKey);
  }

  void saveData(StoreViewModel viewModel) {
    viewModel.moveToNextNode("next");
  }
}
