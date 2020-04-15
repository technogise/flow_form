import '../../json_parser/flow_node.dart';

///Class for action Next node
class NextNode {
  ///Constructor
  NextNode(this.answer);

  ///variable to store child
  String answer;
}

///Class for action set current node
class SetCurrentNode {
  ///Constructor
  SetCurrentNode(this.currentNode);

  ///variable to store current node
  FlowNode currentNode;
}

///Class for action set dashboard node
class SetDashBoardNode {
  ///Constructor
  SetDashBoardNode(this.dashBoardNode);

  ///variable to dashboard node
  FlowNode dashBoardNode;
}

///Enum for Node action
enum NodeActions {
  ///To move to a previous node
  prevNode
}

///Class for action to capture user response
class CaptureUserResponse {
  ///Constructor
  CaptureUserResponse({this.toUpdate});

  ///variable to store user response
  Map<String, dynamic> toUpdate = <String, dynamic>{};
}
