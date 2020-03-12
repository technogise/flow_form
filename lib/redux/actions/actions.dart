import '../../json_parser/node.dart';

///Class for action Next node
class NextNode {
  ///variable to store child
  String answer;

  ///Constructor
  NextNode(this.answer);
}

///Class for action set current node
class SetCurrentNode {
  ///variable to store current node
  Node currentNode;

  ///Constructor
  SetCurrentNode(this.currentNode);
}

///Class for action set dashboard node
class SetDashBoardNode {
  ///variable to dashboard node
  Node dashBoardNode;

  ///Constructor
  SetDashBoardNode(this.dashBoardNode);
}

///Enum for Node action
enum NodeActions {
  ///To move to a previous node
  prevNode
}

///Class for action to capture user response
class CaptureUserResponse {
  ///variable to store user response
  Map<String, dynamic> toUpdate = {};

  ///Constructor
  CaptureUserResponse({this.toUpdate});
}
