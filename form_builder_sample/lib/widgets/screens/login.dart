import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:formbuilder/helpers/authentication.dart';
import 'package:formbuilder/helpers/database.dart';
import 'package:formbuilder/redux/app_state.dart';
import 'package:formbuilder/redux/models/store_view_model.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../../main.dart';
import '../../styles/colors.dart';
import '../components/buttons/rounded_button.dart';
import '../components/text_input.dart';
import 'register.dart';

/// class for login screen component
class LoginScreen extends StatefulWidget {
  /// Static variable to refer this class in routes
  static const id = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showLoader = false;
  String email;
  String password;
  StoreViewModel viewModel;

  void _onLogin(FirebaseUser user) {
    if (user != null) {
      Database.getUserResponse(user.email);
      viewModel.setCurrentUser(user);
      Navigator.pushNamed(context, MyApp.id);
      setState(() {
        showLoader = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StoreViewModel>(
        converter: StoreViewModel.fromStore,
        builder: (context, viewModel) {
          this.viewModel = viewModel;
          return Scaffold(
            backgroundColor: kMainColor,
            body: ModalProgressHUD(
              inAsyncCall: showLoader,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 48.0),
                    TextInput(
                      hintText: 'Enter your email.',
                      onChange: (value) {
                        email = value;
                      },
                      inputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 8.0),
                    TextInput(
                      hintText: 'Enter your password.',
                      onChange: (value) {
                        password = value;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 24.0),
                    RoundedButton(
                      onPressed: (label) {
                        setState(() {
                          showLoader = true;
                        });
                        loginUsingEmailPassword()
                            .then(_onLogin)
                            .catchError(print);
                      },
                      label: 'Log in',
                    ),
                    RoundedButton(
                      onPressed: (label) {
                        googleLogIn().then(_onLogin).catchError(print);
                      },
                      label: 'Google Sign In',
                    ),
                    RoundedButton(
                      onPressed: (label) =>
                          Navigator.pushNamed(context, RegistrationScreen.id),
                      label: 'Register',
                      color: Colors.teal,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
