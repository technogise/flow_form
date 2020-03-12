import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../components/buttons/rounded_button.dart';
import '../components/text_input.dart';

///Class for reusable choice screen component
class RegistrationScreen extends StatefulWidget {
  /// Static variable to refer this class in routes
  static const id = '/register';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showLoader = false;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;

  ///Method to register user and move to login screen
  void _registerUser(String label) {
    setState(() {
      showLoader = true;
    });
    _auth.createUserWithEmailAndPassword(email: email, password: password).then(
      (authResult) {
        if (authResult.user != null) {
          Navigator.pop(context);
        }
      },
    ).catchError(print);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                inputType: TextInputType.emailAddress,
                onChange: (value) {
                  email = value;
                },
                hintText: 'Enter your email',
              ),
              SizedBox(height: 8.0),
              TextInput(
                onChange: (value) {
                  password = value;
                },
                hintText: 'Enter your password',
                obscureText: true,
              ),
              SizedBox(height: 24.0),
              RoundedButton(
                onPressed: _registerUser,
                label: 'Register',
              )
            ],
          ),
        ),
      ),
    );
  }
}
