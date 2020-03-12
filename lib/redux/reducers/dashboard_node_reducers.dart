import 'package:redux/redux.dart';

import '../../json_parser/node.dart';
import '../actions/actions.dart';

///Variable to store dashboard node reducers
final Reducer<Node> dashBoardNodeReducer = combineReducers<Node>([
  TypedReducer<Node, SetDashBoardNode>(setDashBoardNode),
]);

///Set value of dashboard node
Node setDashBoardNode(Node currentNode, SetDashBoardNode action) {
  return action.dashBoardNode;
}
