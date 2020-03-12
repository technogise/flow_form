import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/redux/actions/actions.dart';
import 'package:formbuilder/redux/app_state.dart';
import 'package:formbuilder/redux/store.dart';
import 'routes.dart';
import 'styles/theme.dart';
import 'widgets/screens/login.dart';
import 'widgets/screens/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

///MyApp entry of Finday app
class MyApp extends StatelessWidget {
  /// Static variable to refer this class in routes
  static const id = '/';

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        initialRoute: LoginScreen.id,
        routes: routes,
        title: 'Finday',
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
