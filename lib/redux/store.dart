import 'package:redux/redux.dart';

import 'app_state.dart';
import 'reducers.dart';

var _flowPath = "";
var _dataPath = "";

///Defining one single store for app
final Store store = Store<AppState>(
  appStateReducer,
  initialState: AppState.initialState(_flowPath, _dataPath),
);

void setFlowAndDataPath(String flowPath, String dataScreenPath) {
  _flowPath = flowPath;
  _dataPath = dataScreenPath;
}
