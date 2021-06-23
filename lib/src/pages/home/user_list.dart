import 'package:flutter/material.dart';
import 'package:health_app/src/pages/home/user_tile.dart';
import 'package:health_app/src/pages/models/users.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final usuarios = Provider.of<List<Usuarios>>(context) ?? [];
    /* final usuarios = Provider.of<List<Usuarios>>(context); */
    return ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          return UserTile(usuarios: usuarios[index]);
        });
  }
}
