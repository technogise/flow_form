import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/redux/actions/actions.dart';
import 'package:formbuilder/redux/app_state.dart';
import 'package:formbuilder/redux/store.dart';
import 'package:hive/hive.dart';

import 'styles/theme.dart';
import 'widgets/screens/main_screen.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initHiveDB();
  var flowPath = "assets/json/flow.json";
  var dataPath = "assets/json/screen_data.json";
  setFlowAndDataPath(flowPath, dataPath);
  runApp(MyApp());
}

///MyApp entry of form builder sample
class MyApp extends StatelessWidget {
  /// Static variable to refer this class in routes
  static const id = '/';

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: appTheme,
        home: Scaffold(
          appBar: AppBar(
            leading: BackButton(onPressed: () {
              store.dispatch(NodeActions.prevNode);
            }),
          ),
          body: SafeArea(child: Center(child: MainScreen())),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

void initHiveDB() async {
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox("DataBox");
}
