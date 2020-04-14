library flow_form;

import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flow_form/form.dart';
import 'package:flow_form/question_navigation.dart';
import 'package:flow_form/redux/app_state.dart';
import 'package:flow_form/redux/store.dart';

import 'redux/models/store_view_model.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

class FlowFormNotifier extends StatelessWidget {
  FlowFormNotifier({@required this.builder});

  final FormWidgetBuilder builder;

  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, StoreViewModel>(
          converter: StoreViewModel.fromStore,
          builder: (context, viewModel) {
            if (viewModel.currentNode != null) {
              Map<String, dynamic> screenData =
                  viewModel.currentNode.screenData;
              String type = viewModel.currentNode.type;
              FormMetadata formMetadata = FormMetadata(type, screenData);
              return builder(formMetadata);
            }
            return builder(null);
          });
}

class FlowFormProvider extends InheritedWidget {
  FlowFormProvider({
    Key key,
    @required this.flowForm,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: _buildStoreProvider(child));

  final FlowForm flowForm;

  static FlowFormProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FlowFormProvider>();

  static QuestionNavigation navigatorOf(BuildContext context) {
    StoreViewModel storeViewModel = StoreViewModel.fromStore(store);
    return QuestionNavigation(storeViewModel);
  }

  @override
  bool updateShouldNotify(FlowFormProvider old) => child != old.child;

  Widget getWidget(String screenKey) => flowForm.registerWidget(screenKey);
}

Widget _buildStoreProvider(Widget childWidget) => StoreProvider<AppState>(
      store: store,
      child: childWidget,
    );

class FormMetadata {
  FormMetadata(this.screenType, this.metadata);

  final String screenType;
  final Map<String, dynamic> metadata;
}

typedef FormWidgetBuilder = Widget Function(FormMetadata);
