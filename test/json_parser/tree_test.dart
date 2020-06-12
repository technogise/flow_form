import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flow_form/json_parser/flow_node.dart';
import 'package:flow_form/json_parser/flow_tree.dart';

import '../helper.dart';
import 'test_flow_and_test_data.dart';

void main() {
  setUp(WidgetsFlutterBinding.ensureInitialized);

  test('Tree should make nodes out of json object', () async {
    var flowPath = "test_resources/json/flow.json";
    var dataPath = "test_resources/json/screen_data.json";

    var tree = FlowTree(flowPath, dataPath);
    var dataJson = TestData.basicDataForTwoLinearQuestions;
    tree.screenData = dataJson;

    var dashboardNode = FlowNode({"type": "dashboard"}, null, null);
    var categoryNode = FlowNode({"type": "yes"}, dashboardNode, null);

    dashboardNode.child["CategoryOne"] = categoryNode;
    categoryNode.prevNode = dashboardNode;

    var q1 = FlowNode(
      dataJson["Q1"],
      categoryNode,
      null,
    );

    var q2 = FlowNode(
      dataJson["Q2"],
      q1,
      null,
    );

    q1.child = {"nextQuestion": q2};
    categoryNode.child = {"SectionOne": q1};

    expect(
      true,
      Helper.traverseAndCompareTwoTrees(tree.dashBoardNode, dashboardNode),
    );
  });
}
