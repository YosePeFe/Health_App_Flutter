import 'package:flutter/material.dart';
import 'package:health_app/src/pages/home/login_page.dart';
import 'package:health_app/src/pages/home/signup_page.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogInPage = true;
  void toggleView() {
    setState(() => showLogInPage = !showLogInPage); //
  }

  @override
  Widget build(BuildContext context) {
    if (showLogInPage) {
      return LogInPage(toggleView: toggleView);
    } else {
      return SignUpPage(toggleView: toggleView);
    }
    /* return Container(
      child: LogInPage(),
    ); */
  }
}
