import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../json_parser/node.dart';
import '../json_parser/tree.dart';
import '../user_response.dart';

//ToDo: Separate these two
///Class for single App store
class AppState {
  ///variable to store current node
  Node currentNode;

  ///variable to store dashboard node
  Node dashBoardNode;

  ///variable to store user response
  UserResponse userResponse;

  ///Variable to store current user in app state
  FirebaseUser currentUser;

  ///Constructor
  AppState({
    @required this.currentNode,
    @required this.dashBoardNode,
    @required this.currentUser,
    @required this.userResponse,
  });

  ///Initializing store for the first time
  AppState.initialState(String flowPath, String dataPath) {
    Tree(flowPath, dataPath);
    userResponse = UserResponse();
  }
}
