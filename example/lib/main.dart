import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flow_form/flow_form.dart';
import 'package:flow_form/form.dart';
import 'package:flow_form/question_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'database_impl.dart';
import 'styles/theme.dart';
import 'widgets/screens/date_picker_screen.dart';
import 'widgets/screens/file_upload_screen.dart';
import 'widgets/screens/main_screen.dart';
import 'widgets/screens/select_screen.dart';
import 'widgets/screens/text_input_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initHiveDB();

  final flowFormBuilder = FlowFormBuilder('assets/json/flow.json')
    ..screenMetaPath = 'assets/json/screen_data.json'
    ..database = DatabaseImpl()
    ..registerWidget = (String type) {
      switch (type) {
        case SelectScreen.type:
          return SelectScreen();
        case DatePickerScreen.type:
          return DatePickerScreen();
        case TextInputScreen.type:
          return TextInputScreen();
        case FileUploadScreen.type:
          return FileUploadScreen();
        default:
          return const Center(
            child: Text('Form Ends Here'),
          );
      }
    };

  runApp(MyApp(flowFormBuilder.build()));
}

///MyApp entry of form builder sample
class MyApp extends StatelessWidget {
  MyApp(this.flowForm);

  /// Static variable to refer this class in routes
  static const id = '/';

  final FlowForm flowForm;

  @override
  Widget build(BuildContext context) {
    QuestionNavigation questionNavigation =
        FlowFormProvider.navigatorOf(context);
    BackButtonInterceptor.add((value) {
      if (questionNavigation.isRoot()) {
        return false;
      }
      questionNavigation.gotoPrevious();
      return true;
    });
    return FlowFormProvider(
      flowForm: flowForm,
      child: MaterialApp(
        theme: appTheme,
        home: Scaffold(
          appBar: AppBar(
            leading: BackButton(onPressed: () {
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
