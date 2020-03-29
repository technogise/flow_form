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
  final FormWidgetBuilder builder;

  FlowFormNotifier({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StoreViewModel>(
        converter: StoreViewModel.fromStore,
        builder: (context, viewModel) {
          if (viewModel.currentNode != null) {
            var screenData = viewModel.currentNode.screenData;
            var type = viewModel.currentNode.type;
            var formMetadata = FormMetadata(type, screenData);
            return builder(formMetadata);
          }
          return builder(null);
        });
  }
}

class FlowFormProvider extends InheritedWidget {
  final FlowForm flowForm;

  FlowFormProvider({
    Key key,
    @required this.flowForm,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: _buildStoreProvider(child));

  static FlowFormProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FlowFormProvider>();
  }

  static QuestionNavigation navigatorOf(BuildContext context) {
    var storeViewModel = StoreViewModel.fromStore(store);
    return QuestionNavigation(storeViewModel);
  }

  @override
  bool updateShouldNotify(FlowFormProvider old) {
    return child != old.child;
  }

  Widget getScreen(String screenKey) {
    return flowForm.registerWidgets[screenKey];
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

  FormMetadata(this.screenType, this.metadata);
}

typedef FormWidgetBuilder = Widget Function(FormMetadata);
