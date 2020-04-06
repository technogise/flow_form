///Class for making objects for each node in the flow tree
class FlowNode {
  /// variable to map answers and next question
  Map<String, FlowNode> child = {};

  /// Map to store question related data
  Map<String, dynamic> screenData;

  ///variable to store type of screen used to render this question
  String type;

  ///variable to store which question's answer is used to find next question
  String dependsOn;

  ///variable to store previous question
  FlowNode prevNode;

  ///variable to store key to this answer's question
  String dataKey;

  ///variable to store section name of this question
  String sectionName;

  ///Constructing node
  FlowNode(this.screenData, this.prevNode, this.dataKey, [this.sectionName]) {
    if (screenData != null) {
      type = screenData["type"];
    }
  }

  ///Returns if this question has more subsequent question
  bool hasChild() {
    return child.length > 0;
  }

  ///Gives the next question node
  FlowNode getChild(String answer) {
    if (child.length == 1) {
      return child.values.first;
    }
    return child[answer.toLowerCase()];
  }
}
