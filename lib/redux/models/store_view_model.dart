import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';

import '../../json_parser/node.dart';
import '../actions/actions.dart';
import '../actions/current_user_actions.dart';
import '../app_state.dart';
import 'abstract_view_model.dart';

///Class for filtering info given to components from store
class StoreViewModel extends ViewModel {
  ///variable to store current node
  Node currentNode;

  ///Variable to store current user
  FirebaseUser currentUser;

  ///variable to store next node function
  void Function(String) moveToNextNode;

  ///Function to set current user in store
  void Function(FirebaseUser) setCurrentUser;

  ///variable to store selectedValue
  final dynamic selectedValue;

  ///Constructor
  StoreViewModel(
      {this.currentNode,
      this.currentUser,
      this.moveToNextNode,
      this.setCurrentUser,
      this.selectedValue});

  ///Create from store to generate Tree View Model
  static StoreViewModel fromStore(Store<AppState> store) {
    var state = store.state;
    return StoreViewModel(
        currentNode: state.currentNode,
        currentUser: state.currentUser,
        moveToNextNode: (answer) {
          store.dispatch(NextNode(answer));
        },
        selectedValue: getSelectedValue(store),
        setCurrentUser: (FirebaseUser user) {
          store.dispatch(SetCurrentUser(user));
        });
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
}
