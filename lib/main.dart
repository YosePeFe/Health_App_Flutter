import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/pages/home/login_page.dart';
import 'package:health_app/src/pages/models/user.dart';
import 'package:health_app/src/pages/wrapper.dart';
import 'package:health_app/src/services/authservice.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //Inicializar dependencias de flutter antes de los widgets
  await Firebase
      .initializeApp(); //Verificar la información del archivo de google services para incializar el proyecto de firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return StreamProvider<Username>.value(
        value: AuthService().user, //qué stream y qué datos recuperar
        child: MaterialApp(
          title: 'Proyecto Final',
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
          routes: <String, WidgetBuilder>{
            "Login": (BuildContext context) => LogInPage(),
          },
        ) //acceder a los datos del stream (usuario)
        ); /* LogInPage()); */
  }
}
