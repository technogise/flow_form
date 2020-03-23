import 'package:formbuilder/json_parser/flow_tree.dart';
import 'package:formbuilder/helpers/database.dart';
import 'package:redux/redux.dart';

import '../../json_parser/flow_node.dart';
import '../actions/actions.dart';
import '../app_state.dart';
import 'abstract_view_model.dart';

///Class for filtering info given to components from store
class StoreViewModel extends ViewModel {
  ///variable to store current node
  FlowNode currentNode;

  ///variable to store next node function
  void Function(String) moveToNextNode;

  ///variable to store selectedValue
  final dynamic selectedValue;

  Database database;

  ///Constructor
  StoreViewModel({this.currentNode, this.moveToNextNode, this.selectedValue,  this.database});

  ///Create from store to generate Tree View Model
  static StoreViewModel fromStore(Store<AppState> store) {
    var state = store.state;
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
    var state = store.state;
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

  TextInputMeta getTextInputMeta() {
    return TextInputMeta(
      getScreenData("hint"),
      getScreenData("buttonText"),
    );
  }

  SelectScreenMeta getSelectScreenMeta() {
    return SelectScreenMeta(getScreenData("question"), getScreenData("label"),
        getScreenData("select-type"), getScreenData("options"), selectedValue);
  }

  void goToNextQuestion() {
    moveToNextNode(keyForNextQuestion);
  }
}

class TextInputMeta {
  final String hintText;
  final String buttonText;

  TextInputMeta(this.hintText, this.buttonText);
}

class SelectScreenMeta {
  final String question;
  final String comment;
  final String optionType;
  final String selectedValue;
  final List<dynamic> options;

  SelectScreenMeta(this.question, this.comment, this.optionType, this.options,
      this.selectedValue);
}
