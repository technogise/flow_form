import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/helpers/data_storage.dart';
import 'package:formbuilder/redux/app_state.dart';
import 'package:formbuilder/redux/models/store_view_model.dart';

import '../../database_impl.dart';
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
        var selectScreenMeta = viewModel.getSelectScreenMeta();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Comment(text: selectScreenMeta.comment),
            QuestionCard(text: selectScreenMeta.question),
            SelectMapper.getSelect(
              selectScreenMeta,
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
    viewModel.database.saveData(viewModel: viewModel, answer: answer);
    String child = answer is List<dynamic> ? answer.first : answer;
    viewModel.moveToNextNode(child);
  }
}
