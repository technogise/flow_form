import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';

import '../actions/current_user_actions.dart';

///variable to store current node reducers
final Reducer<FirebaseUser> currentUserReducers =
    combineReducers<FirebaseUser>([
  TypedReducer<FirebaseUser, SetCurrentUser>(setCurrentUser),
]);

///Reducer to set value of currentNode
FirebaseUser setCurrentUser(FirebaseUser currentUser, SetCurrentUser action) {
  return action.currentUser;
}
