import 'package:flutter/material.dart';
import 'package:health_app/src/pages/auth/auth.dart';
import 'package:health_app/src/pages/models/user.dart';
import 'package:provider/provider.dart';
import 'home/menu_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Username>(
        context); // accesar a los datos del usuario al obtener un valor

    //return either home or auth
    if (user == null) {
      return Authenticate();
    } else {
      return MenuPage();
    }
  }
}
