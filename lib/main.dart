import 'package:health_app/src/pages/home/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto Final',
      debugShowCheckedModeBanner: false,
      home:LogInPage()
    );
  }
}
