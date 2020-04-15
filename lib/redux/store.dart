import 'package:redux/redux.dart';

import '../helpers/database.dart';
import 'app_state.dart';
import 'reducers.dart';

String _flowPath = '';
String _dataPath = '';
Database _globalDB;

///Defining one single store for app
final Store<AppState> store = Store<AppState>(
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
