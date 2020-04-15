import 'json_parser/flow_node.dart';
import 'json_parser/flow_tree.dart';
import 'redux/actions/actions.dart';
import 'redux/models/store_view_model.dart';
import 'redux/store.dart';

class QuestionNavigation {
  QuestionNavigation(this._viewModel);

  final StoreViewModel _viewModel;

  void submitAnswer(String answerKey) {
    _viewModel.database.saveData(
      dataKey: getCurrentDataKey(),
      answer: answerKey,
    );
    _viewModel.moveToNextNode(keyForNextQuestion);
  }

  void gotoPrevious() {
    store.dispatch(NodeActions.prevNode);
  }

  // TODO(Burhanuddin): Improve readability.
  bool isRoot() {
    final FlowNode currentNode = store.state.currentNode;
    final FlowNode dashboardNode = store.state.dashBoardNode;
    return currentNode == dashboardNode;
  }

  TextInputMeta getTextInputMeta() => _viewModel.getTextInputMeta();

  void goToNext(String answer) {
    _viewModel.database.saveData(
      dataKey: getCurrentDataKey(),
      answer: answer,
    );
    _viewModel.moveToNextNode(answer);
  }

  SelectScreenMeta getSelectScreenMeta() => _viewModel.getSelectScreenMeta();

  String getCurrentDataKey() => _viewModel.currentNode.dataKey;

  /// Dashboard calls
  // TODO(Burhanuddin): Refactor and remove
  @deprecated
  void gotoDashboard() {
    FlowNode dashBoardNode = store.state.dashBoardNode;
    store.dispatch(SetCurrentNode(dashBoardNode));
  }

  @deprecated
  void gotoSection(String sectionName) {
    FlowNode sectionNode = store.state.currentNode;
    store.dispatch(SetCurrentNode(sectionNode.child[sectionName]));
  }
}
