import 'package:flutter/foundation.dart';

import '../json_parser/flow_node.dart';
import '../json_parser/flow_tree.dart';
import '../user_response.dart';

//ToDo: Separate these two
///Class for single App store
class AppState {
  ///variable to store current node
  FlowNode currentNode;

  ///variable to store dashboard node
  FlowNode dashBoardNode;

  ///variable to store user response
  UserResponse userResponse;

  ///Constructor
  AppState({
    @required this.currentNode,
    @required this.dashBoardNode,
    @required this.userResponse,
  });

  ///Initializing store for the first time
  AppState.initialState(String flowPath, String dataPath) {
    FlowTree(flowPath, dataPath);
    userResponse = UserResponse();
  }
}
