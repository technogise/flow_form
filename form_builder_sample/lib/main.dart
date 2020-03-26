import 'package:flutter/material.dart';
import 'package:formbuilder/formbuilder.dart';
import 'package:formbuilder/redux/actions/actions.dart';
import 'package:formbuilder/redux/store.dart';
import 'package:formbuildersample/database_impl.dart';
import 'package:formbuildersample/widgets/screens/dashboard.dart';
import 'package:formbuildersample/widgets/screens/date_picker_screen.dart';
import 'package:formbuildersample/widgets/screens/file_upload_screen.dart';
import 'package:formbuildersample/widgets/screens/section_screen.dart';
import 'package:formbuildersample/widgets/screens/select_screen.dart';
import 'package:formbuildersample/widgets/screens/text_input_screen.dart';
import 'package:formbuilder/widget_registry.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'styles/theme.dart';
import 'widgets/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  registerWidgets();
  initHiveDB();
  var flowPath = "assets/json/flow.json";
  var dataPath = "assets/json/screen_data.json";
  setFlowAndDataPath(flowPath, dataPath);
  setupDB(DatabaseImpl());
  runApp(MyApp());
}

///MyApp entry of form builder sample
class MyApp extends StatelessWidget {
  /// Static variable to refer this class in routes
  static const id = '/';

  @override
  Widget build(BuildContext context) {
    return FormBuilderProvider(
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
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox("DataBox");
}

void registerWidgets() {
  var map = {
    SelectScreen.type: SelectScreen(),
    DatePickerScreen.type: DatePickerScreen(),
    Dashboard.type: Dashboard(),
    TextInputScreen.type: TextInputScreen(),
    RenderSection.type: RenderSection(),
    FileUploadScreen.type: FileUploadScreen()
  };

  final widgetRegistry = getRegistry();
  widgetRegistry.registerWidget(map);
}