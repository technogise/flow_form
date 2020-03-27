library formbuilder;

import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/redux/actions/actions.dart';
import 'package:formbuilder/redux/app_state.dart';
import 'package:formbuilder/redux/store.dart';

import 'json_parser/flow_tree.dart';
import 'redux/models/store_view_model.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class FormBuilderNotifier extends StatelessWidget {
  final FormWidgetBuilder builder;

  FormBuilderNotifier({@required this.builder});

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

class FormBuilderProvider extends InheritedWidget {
  FormBuilderProvider({
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: _buildStoreProvider(child));

  static FormBuilderProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FormBuilderProvider>();
  }

  static QuestionNavigation navigatorOf(BuildContext context) {
    var storeViewModel = StoreViewModel.fromStore(store);
    return QuestionNavigation(storeViewModel);
  }

  @override
  bool updateShouldNotify(FormBuilderProvider old) {
    return child != old.child;
  }
}

Widget _buildStoreProvider(Widget childWidget) {
  return StoreProvider<AppState>(
    store: store,
    child: childWidget,
  );
}

class FormMetadata {
  final String screenType;
  final Map<String, dynamic> metadata;
  final QuestionNavigation questionNavigation;

  FormMetadata(this.screenType, this.metadata, this.questionNavigation);
}

class QuestionNavigation {
  final StoreViewModel _viewModel;

  QuestionNavigation(this._viewModel);

  void submitAnswer(String answerKey) {
    _viewModel.database.saveData(viewModel: _viewModel, answer: answerKey);
    _viewModel.moveToNextNode(keyForNextQuestion);
  }

  void gotoPrevious() {
    store.dispatch(NodeActions.prevNode);
  }

  String getCurrentData() {
    var currentNode = store.state.currentNode;
    return store.state.database.getCurrentData(currentNode.dataKey);
  }

  TextInputMeta getTextInputMeta() {
    return _viewModel.getTextInputMeta();
  }
}

typedef FormWidgetBuilder = Widget Function(FormMetadata);
