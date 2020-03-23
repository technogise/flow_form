import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/redux/app_state.dart';
import 'package:formbuilder/redux/models/store_view_model.dart';
import 'package:formbuildersample/database_impl.dart';
import 'package:redux/redux.dart';

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
      onInit: initializeScreen,
      converter: StoreViewModel.fromStore,
      builder: (context, viewModel) {
        var textInputMeta = viewModel.getTextInputMeta();
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
                  saveData(viewModel);
                },
              )
            ],
          ),
        );
      },
    );
  }

  void initializeScreen(Store<AppState> store) async{
    var currentNode = store.state.currentNode;
    inputText = store.state.database.getData(currentNode.dataKey);
  }

  void saveData(StoreViewModel viewModel) {
    viewModel.database.saveData(viewModel: viewModel, answer: inputText);
    viewModel.moveToNextNode(keyForNextQuestion);
  }
}
