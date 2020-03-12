import 'package:firebase_auth/firebase_auth.dart';

///Action to set current user
class SetCurrentUser {
  ///Current User
  FirebaseUser currentUser;

  ///Constructor to initialise current user
  SetCurrentUser(this.currentUser);
}
