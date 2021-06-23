import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health_app/src/pages/models/user.dart';
import 'package:health_app/src/pages/models/users.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('usuarios');

  Future updateUserData(
    String nombre,
    String genero,
    int edad,
  ) async {
    return await userCollection.doc(uid).set({
      'nombre': nombre,
      'genero': genero,
      'edad': edad,
    });
  }

  //users list form snapshot
  List<Usuarios> _usersListFormSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Usuarios(
          nombre: doc.get('nombre') ?? '',
          genero: doc.get('genero') ?? '',
          edad: doc.get('edad') ?? 0);
    }).toList();
  }

  //userData from Snapshot
  UserData _userDataSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        nombre: snapshot['nombre'],
        genero: snapshot['genero'],
        edad: snapshot['edad']);
  }

  // get users stream
  Stream<List<Usuarios>> get usuarios {
    return userCollection.snapshots().map(_usersListFormSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map(_userDataSnapshot);
  }
}
