import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formbuilder/json_parser/node.dart';
import 'package:formbuilder/json_parser/tree.dart';

import '../helper.dart';
import 'test_flow_and_test_data.dart';

void main() {
  setUp(WidgetsFlutterBinding.ensureInitialized);

  test('Tree should make nodes out of json object', () {
    var flowPath = "packages/formbuilder/assets/json/flow.json";
    var dataPath = "packages/formbuilder/assets/json/screen_data.json";
    var tree = Tree(flowPath, dataPath);
    var dataJson = TestData.basicDataForTwoLinearQuestions;
    tree.screenData = dataJson;

    tree.buildTreeForAllCategory(
      Map<String, dynamic>.from(TestData.basicFlowForTwoLinearQuestions),
    );

    var dashboardNode = Node({"type": "dashboard"}, null, null, null);
    var categoryNode =
        Node({"type": "section"}, dashboardNode, "Personal details", null);

    dashboardNode.child["Personal details"] = categoryNode;
    categoryNode.prevNode = dashboardNode;

    var q1 = Node(
      dataJson["Q1"],
      categoryNode,
      "Personal details",
      "section one",
    );

    var q2 = Node(
      dataJson["Q2"],
      q1,
      "Personal details",
      "section one",
    );

    q1.child = {"next": q2};
    categoryNode.child = {"section one": q1};

    expect(
      true,
      Helper.traverseAndCompareTwoTrees(tree.dashBoardNode, dashboardNode),
    );
  });
}
