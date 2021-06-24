import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_app/src/pages/models/user.dart';

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
  /* Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;

      return _userFromFirebaseUser(user);
      /* _userFromFirebaseUser(user) */
    } catch (e) {
      print(e.toString());
      return null;
    }
  } */

  //Sign in email / password
  signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //Register email / password
  createUserWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email,
              password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  //collection
  collection(String _nombre, String _genero, String _edad) {
    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance.collection("usuarios").doc(firebaseUser.uid).set({
      "Nombre": _nombre,
      "Genero": _genero,
      "Edad": _edad
    }).then((_) {
      print("success!");
    });
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
