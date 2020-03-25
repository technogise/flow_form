import 'package:formbuilder/helpers/database.dart';
import 'package:redux/redux.dart';

import 'app_state.dart';
import 'reducers.dart';

var _flowPath = "";
var _dataPath = "";
Database _globalDB;

///Defining one single store for app
final Store store = Store<AppState>(
  appStateReducer,
  initialState: AppState.initialState(_flowPath, _dataPath, _globalDB),
);

void setFlowAndDataPath(String flowPath, String dataScreenPath) {
  _flowPath = flowPath;
  _dataPath = dataScreenPath;
}

void setupDB(Database database) {
  _globalDB = database;
}

