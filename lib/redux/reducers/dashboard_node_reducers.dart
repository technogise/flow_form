import 'package:redux/redux.dart';

import '../../json_parser/flow_node.dart';
import '../actions/actions.dart';

///Variable to store dashboard node reducers
final Reducer<FlowNode> dashBoardNodeReducer = combineReducers<FlowNode>([
  TypedReducer<FlowNode, SetDashBoardNode>(setDashBoardNode),
]);

///Set value of dashboard node
FlowNode setDashBoardNode(FlowNode currentNode, SetDashBoardNode action) {
  return action.dashBoardNode;
}
