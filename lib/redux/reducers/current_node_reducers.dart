import 'package:redux/redux.dart';

import '../../json_parser/node.dart';
import '../actions/actions.dart';
import '../store.dart';

///variable to store current node reducers
final Reducer<Node> currentNodeReducers = combineReducers<Node>([
  TypedReducer<Node, SetCurrentNode>(setCurrentNode),
  TypedReducer<Node, NextNode>(moveToNextNode),
  TypedReducer<Node, NodeActions>(nodeReducers)
]);

///Reducer to set value of currentNode
Node setCurrentNode(Node currentNode, SetCurrentNode action) {
  return action.currentNode;
}

///Reducer to move to next question
Node moveToNextNode(Node currentNode, NextNode action) {
  if (currentNode.dependsOn == currentNode.dataKey) {
    return currentNode.getChild(action.answer);
  }
  var dependsOn = currentNode.dependsOn;
  var userResponse = store.state.userResponse.get(null);
  return currentNode.getChild(userResponse[dependsOn]);
}

///Reducer to change current node's value
Node nodeReducers(Node currentNode, NodeActions action) {
  var newNode = currentNode;
  switch (action) {
    case NodeActions.prevNode:
      {
        newNode = currentNode.prevNode;
        newNode ??= currentNode;
      }
  }

  return newNode;
}
