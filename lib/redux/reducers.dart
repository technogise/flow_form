import 'app_state.dart';
import 'reducers/current_node_reducers.dart';
import 'reducers/dashboard_node_reducers.dart';
import 'reducers/user_response_reducers.dart';

///Class for mapping reducers
AppState appStateReducer(AppState state, dynamic action) {
  return AppState(
      currentNode: currentNodeReducers(state.currentNode, action),
      dashBoardNode: dashBoardNodeReducer(state.dashBoardNode, action),
      userResponse: userResponseReducer(state.userResponse, action),
  );
}
