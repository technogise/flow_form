import 'package:redux/redux.dart';

import '../../json_parser/flow_node.dart';
import '../actions/actions.dart';
import '../store.dart';

///variable to store current node reducers
final Reducer<FlowNode> currentNodeReducers = combineReducers<FlowNode>([
  TypedReducer<FlowNode, SetCurrentNode>(setCurrentNode),
  TypedReducer<FlowNode, NextNode>(moveToNextNode),
  TypedReducer<FlowNode, NodeActions>(nodeReducers)
]);

///Reducer to set value of currentNode
FlowNode setCurrentNode(FlowNode currentNode, SetCurrentNode action) {
  return action.currentNode;
}

///Reducer to move to next question
FlowNode moveToNextNode(FlowNode currentNode, NextNode action) {
  if (currentNode.dependsOn == currentNode.dataKey) {
    return currentNode.getChild(action.answer);
  }
  var dependsOn = currentNode.dependsOn;
  var userResponse = store.state.userResponse.get(null);
  return currentNode.getChild(userResponse[dependsOn]);
}

///Reducer to change current node's value
FlowNode nodeReducers(FlowNode currentNode, NodeActions action) {
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
