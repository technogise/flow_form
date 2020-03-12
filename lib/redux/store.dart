import 'package:redux/redux.dart';
import 'app_state.dart';
import 'reducers.dart';

///Defining one single store for app
final Store store = Store<AppState>(
  appStateReducer,
  initialState: AppState.initialState(),
);
