import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> loginwithEmailandPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      return null;
    }
  }

  Future<User?> registerwithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(credential.user);
      return credential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
