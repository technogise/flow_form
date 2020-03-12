///Class for making objects for each node in the flow tree
class Node {
  /// variable to map answers and next question
  Map<String, Node> child = {};

  /// Map to store question related data
  Map<String, dynamic> screenData;

  ///variable to store type of screen used to render this question
  String type;

  ///variable to store which question's answer is used to find next question
  String dependsOn;

  ///variable to store previous question
  Node prevNode;

  ///variable to store key to this answer's question
  String dataKey;

  ///variable to store category name of this question
  String categoryName;

  ///variable to store section name of this question
  String sectionName;

  ///Constructing node
  Node(this.screenData, this.prevNode, this.dataKey, this.categoryName,
      [this.sectionName]) {
    if (screenData != null) {
      type = screenData["type"];
    }
  }

  ///Returns if this question has more subsequent question
  bool hasChild() {
    return child.length > 0;
  }

  ///Gives the next question node
  Node getChild(String answer) {
    if (child.length == 1) {
      return child.values.first;
    }
    return child[answer];
  }
}
