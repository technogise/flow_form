import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/helpers/database.dart';
import 'package:formbuilder/redux/app_state.dart';
import 'package:formbuilder/redux/models/store_view_model.dart';

import '../../mappers/select_type_mapper.dart';
import '../components/comment.dart';
import '../components/question.dart';

///Class for reusable choice screen component
class SelectScreen extends StatelessWidget {
  /// Static variable to refer this class in routes
  static const type = 'select-input';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StoreViewModel>(
      converter: StoreViewModel.fromStore,
      builder: (context, viewModel) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Comment(text: viewModel.getScreenData("label")),
            QuestionCard(text: viewModel.getScreenData("question")),
            SelectMapper.getSelect(
              type: viewModel.getScreenData("select-type"),
              options: viewModel.getScreenData("options"),
              selectedValue: viewModel.selectedValue,
              next: (answer) {
                saveDataAndMoveToNextPage(answer, viewModel);
              },
            )
          ],
        );
      },
    );
  }

  /// Function to save Data in fireBase and move user to the next screen
  void saveDataAndMoveToNextPage(
    dynamic answer,
    StoreViewModel viewModel,
  ) {
    Database.saveData(viewModel: viewModel, answer: answer);
    String child = answer is List<String> ? answer.first : answer;
    viewModel.moveToNextNode(child);
  }
}
