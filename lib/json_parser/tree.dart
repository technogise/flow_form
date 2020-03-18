import 'dart:convert';

import '../helpers/common.dart';
import '../redux/actions/actions.dart';
import '../redux/store.dart';
import 'node.dart';

/// Class to handle all node related operations
class Tree {
  ///Variable to store dashboard node
  Node dashBoardNode;

  ///map to sore screen data json
  Map<String, dynamic> screenData;

  ///variable to store key used to fetch next question from flow.json
  final String keyForNextQuestion = "next";

  ///variable to store key used to fetch questionId from flow.json
  final String keyForDataId = "fieldId";

  ///variable to store key used to fetch dependsOn value from flow.json
  final String nextQuestionDependsOn = "valueOf";

  ///variable to store key used to fetch dependsOn value from flow.json
  final String answers = "value";

  ///Constructing tree
  Tree(String flowPath, String screenMetadataPath) {
    Map<String, dynamic> flow;

    var assignFlow = Serializer.fetchJson(flowPath).then((parsedFlow) {
      flow = parsedFlow;
    });

    var assignData =
        Serializer.fetchJson(screenMetadataPath).then((parsedData) {
      screenData = parsedData;
    });

    Future.wait([assignFlow, assignData]).then((resolved) {
      buildTreeForAllCategory(flow);
    });
  }

  ///Building tree for all categories
  void buildTreeForAllCategory(Map<String, dynamic> flow) {
    dashBoardNode = buildDashBoardNode();
    //ToDo: Make this readable
    flow.forEach((categoryName, category) {
      var categoryNode = Node(
        ///ToDo: Type should be category
        {"type": "section"},
        dashBoardNode,
        null,
        categoryName,
      );
      category.forEach((sectionName, section) {
        var sectionNode = build(
          section,
          categoryNode,
          categoryName,
          sectionName,
        );
        categoryNode.child[sectionName] = sectionNode;
      });
      dashBoardNode.child[categoryName] = categoryNode;
    });
    goToDashboard();
  }

  //ToDo: Rename flow to category or current node
  ///Build tree for given
  Node build(
    Map<String, dynamic> flow,
    Node parent,
    String categoryName,
    String sectionName,
  ) {
    String screenId = flow[keyForDataId].first;
    Map<String, dynamic> screenDetails = screenData[screenId];

    var currentNode = Node(
      screenDetails,
      parent,
      screenId,
      categoryName,
      sectionName,
    );

    //ToDo: Rethink logic for this
    if (flow[keyForDataId].length > 1) {
      flow[keyForDataId].removeAt(0);
      var childNode = build(flow, currentNode, categoryName, sectionName);
      currentNode.child[keyForNextQuestion] = childNode;
      return currentNode;
    }

    Map<String, dynamic> childDetails = flow[keyForNextQuestion];
    currentNode.dependsOn = childDetails[nextQuestionDependsOn];
    //ToDo: Make this readable
    childDetails[answers].forEach((answerArray, nextQuestion) {
      List<dynamic> answers = json.decode(answerArray);
      var childNode = build(
        nextQuestion,
        currentNode,
        categoryName,
        sectionName,
      );
      for (var answer in answers) {
        currentNode.child[answer] = childNode;
      }
    });
    return currentNode;
  }

  ///Function which dispatched action to take user to dashboard
  void goToDashboard() {
    store.dispatch(SetCurrentNode(dashBoardNode));
    store.dispatch(SetDashBoardNode(dashBoardNode));
  }

  ///Function which gives dashboard node
  Node buildDashBoardNode() {
    return Node({"type": "dashboard"}, null, null, null);
  }
}
