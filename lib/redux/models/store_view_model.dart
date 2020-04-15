import 'package:redux/redux.dart';

import '../../helpers/database.dart';
import '../../json_parser/flow_node.dart';
import '../../json_parser/flow_tree.dart';
import '../actions/actions.dart';
import '../app_state.dart';
import 'abstract_view_model.dart';

///Class for filtering info given to components from store
class StoreViewModel extends ViewModel {
  ///Constructor
  StoreViewModel(
      {this.currentNode,
      this.moveToNextNode,
      this.selectedValue,
      this.database});

  ///variable to store current node
  FlowNode currentNode;

  ///variable to store next node function
  void Function(String) moveToNextNode;

  ///variable to store selectedValue
  final dynamic selectedValue;

  Database database;

  ///Create from store to generate Tree View Model
  static StoreViewModel fromStore(Store<AppState> store) {
    AppState state = store.state;
    return StoreViewModel(
        currentNode: state.currentNode,
        moveToNextNode: (answer) {
          store.dispatch(NextNode(answer));
        },
        selectedValue: getSelectedValue(store),
        database: store.state.database);
  }

  //ToDo: Please add docs
  static dynamic getSelectedValue(Store<AppState> store) {
    AppState state = store.state;
    if (state.currentNode != null) {
      return state.userResponse.get(state.currentNode.dataKey);
    }
    return null;
  }

  /// Fetch data from nested object
  ///
  /// this needs to be dynamic because options is a list and others are string
  /// or objects
  dynamic getScreenData(String key) => currentNode.screenData[key];

  TextInputMeta getTextInputMeta() => TextInputMeta(
        getScreenData('hint') as String,
        getScreenData('buttonText') as String,
      );

  SelectScreenMeta getSelectScreenMeta() => SelectScreenMeta(
        getScreenData('question') as String,
        getScreenData('label') as String,
        getScreenData('select-type') as String,
        getScreenData('options') as List<dynamic>,
        selectedValue as String,
      );

  void goToNextQuestion() {
    moveToNextNode(keyForNextQuestion);
  }
}

class TextInputMeta {
  TextInputMeta(this.hintText, this.buttonText);

  final String hintText;
  final String buttonText;
}

class SelectScreenMeta {
  SelectScreenMeta(this.question, this.comment, this.optionType, this.options,
      this.selectedValue);

  final String question;
  final String comment;
  final String optionType;
  final String selectedValue;
  final List<dynamic> options;
}
