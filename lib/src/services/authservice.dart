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
        .map(_userFromFirebaseUser);
  }

  //collection
  collection(String _nombre, String _genero, String _edad) {
    final firestoreInstance = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    firestoreInstance
        .collection("usuarios")
        .doc(firebaseUser.uid)
        .set({"Nombre": _nombre, "Genero": _genero, "Edad": _edad}).then((_) {
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
