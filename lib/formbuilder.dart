library formbuilder;

import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/redux/app_state.dart';

import 'redux/models/store_view_model.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class FormBuilderWidget extends StatelessWidget {
  final FormWidgetBuilder builder;

  FormBuilderWidget({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StoreViewModel>(
        converter: StoreViewModel.fromStore,
        builder: (context, viewModel) {
          if (viewModel.currentNode != null) {
            var screenData = viewModel.currentNode.screenData;
            var type = viewModel.currentNode.type;
            var formMetadata =
                FormMetadata(type, screenData, QuestionNavigation(viewModel));
            return builder(formMetadata);
          }
          return builder(null);
        });
  }
}

class FormMetadata {
  final String screenType;
  final Map<String, dynamic> metadata;
  final QuestionNavigation questionNavigation;

  FormMetadata(this.screenType, this.metadata, this.questionNavigation);
}

class QuestionNavigation {
  final StoreViewModel viewModel;

  QuestionNavigation(this.viewModel);

  void submitAnswer(String answerKey) {}
}

typedef FormWidgetBuilder = Widget Function(FormMetadata);
