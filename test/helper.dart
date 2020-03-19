import 'package:collection/collection.dart';
import 'package:formbuilder/json_parser/flow_node.dart';

///Helper class for test
class Helper {
  ///Compare two nodes and there properties
  static bool compareTwoNodes(FlowNode n1, FlowNode n2) {
    var compare = [
      hasSameNumberOfChild(n1, n2),
      hasSameAnswers(n1, n2),
      hasSameType(n1, n2),
      hasSameDependsOn(n1, n2),
      hasSameDataKey(n1, n2),
      hasSameSectionName(n1, n2),
      hasSameParent(n1, n2),
    ];

    return compare.every((isEqual) => isEqual);
  }

  static bool hasSameNumberOfChild(FlowNode n1, FlowNode n2) =>
      n1.child.length == n2.child.length;

  static bool hasSameDependsOn(FlowNode n1, FlowNode n2) =>
      n1.dependsOn == n2.dependsOn;

  static bool hasSameType(FlowNode n1, FlowNode n2) => n1.type == n2.type;

  static bool hasSameDataKey(FlowNode n1, FlowNode n2) => n1.dataKey == n2.dataKey;

  static bool hasSameSectionName(FlowNode n1, FlowNode n2) =>
      n1.categoryName == n2.categoryName;

  static bool hasSameAnswers(FlowNode n1, FlowNode n2) {
    Function eq = const ListEquality().equals;
    return eq(n1.child.keys.toList(), n2.child.keys.toList());
  }

  static bool hasSameParent(FlowNode n1, FlowNode n2) {
    var isN1ParentNull = n1.prevNode == null;
    var isN2ParentNull = n2.prevNode == null;

    if (!isN1ParentNull && !isN2ParentNull) {
      return n1.prevNode.dataKey == n2.prevNode.dataKey;
    }
    return true;
  }

  /// traverse and compare two trees
  static bool traverseAndCompareTwoTrees(FlowNode t1, FlowNode t2) {
    if (!compareTwoNodes(t1, t2)) {
      return false;
    }
    var isEqual = true;
    t1.child.forEach((answer, child) {
      isEqual = isEqual && traverseAndCompareTwoTrees(child, t2.child[answer]);
    });
    return isEqual;
  }
}
