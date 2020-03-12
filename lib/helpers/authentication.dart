import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

///Single instance to provide Firebase Authentication services
final FirebaseAuth _auth = FirebaseAuth.instance;

///Single instatance to provide google sign in services
final GoogleSignIn _googleSignIn = GoogleSignIn();

///Method to sign in using google
Future<FirebaseUser> googleLogIn() async {
  final googleUser = await _googleSignIn.signIn();
  final googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final user = (await _auth.signInWithCredential(credential)).user;

  return user;
}

///Method to login using Email and Password
Future<FirebaseUser> loginUsingEmailPassword() async {
  await _auth.signInWithEmailAndPassword(
      email: "almoNature@gmail.com", password: "111111");
  final user = await _auth.currentUser();

  return user;
}
