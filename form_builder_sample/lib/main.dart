import 'package:flow_form/flow_form.dart';
import 'package:flow_form/form.dart';
import 'package:flutter/material.dart';
import 'package:formbuildersample/database_impl.dart';
import 'package:formbuildersample/widgets/screens/dashboard.dart';
import 'package:formbuildersample/widgets/screens/date_picker_screen.dart';
import 'package:formbuildersample/widgets/screens/file_upload_screen.dart';
import 'package:formbuildersample/widgets/screens/section_screen.dart';
import 'package:formbuildersample/widgets/screens/select_screen.dart';
import 'package:formbuildersample/widgets/screens/text_input_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'styles/theme.dart';
import 'widgets/screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initHiveDB();

  final flowFormBuilder = FlowFormBuilder("assets/json/flow.json")
    ..screenMetaPath = "assets/json/screen_data.json"
    ..database = DatabaseImpl()
    ..registerWidgets = {
      SelectScreen.type: SelectScreen(),
      DatePickerScreen.type: DatePickerScreen(),
      Dashboard.type: Dashboard(),
      TextInputScreen.type: TextInputScreen(),
      RenderSection.type: RenderSection(),
      FileUploadScreen.type: FileUploadScreen()
    };

  runApp(MyApp(flowFormBuilder.build()));
}

///MyApp entry of form builder sample
class MyApp extends StatelessWidget {
  /// Static variable to refer this class in routes
  static const id = '/';

  final FlowForm flowForm;

  MyApp(this.flowForm);

  @override
  Widget build(BuildContext context) {
    return FlowFormProvider(
      flowForm: flowForm,
      child: MaterialApp(
        theme: appTheme,
        home: Scaffold(
          appBar: AppBar(
            leading: BackButton(onPressed: () {
              var questionNavigation = FlowFormProvider.navigatorOf(context);
              questionNavigation.gotoPrevious();
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
