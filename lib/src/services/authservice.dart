import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_app/src/pages/models/user.dart';
import 'package:health_app/src/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // obj usuario basado en firebaseuser
  Username _userFromFirebaseUser(User user) {
    return user != null ? Username(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Username> get user {
    return _auth
        .authStateChanges()
        //.map((User user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //Sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;

      return _userFromFirebaseUser(user);
      /* _userFromFirebaseUser(user) */
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign in email / password
  Future logInEmailPass(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Register email / password
  Future signUpEmailPass(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      //create a new doc for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData('Nuevo Usuario', 'Hombre', 20);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign out
  Future signOut() async {
    try {
      return await _auth.signOut(); //instancia / método firebase
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
