import 'package:flutter/material.dart';
import 'package:health_app/src/pages/models/users.dart';

class UserTile extends StatelessWidget {
  final Usuarios usuarios;
  UserTile({this.usuarios});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
          margin: EdgeInsets.fromLTRB(10, 6, 20, 0),
          child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.brown[usuarios.edad],
              ),
              title: Text(usuarios.nombre),
              subtitle: Text('Tiene ${usuarios.edad} año(s)'))),
    );
  }
}
