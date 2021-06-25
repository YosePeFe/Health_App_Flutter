import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_app/src/pages/home/menu_page.dart';
import 'package:health_app/src/services/authservice.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  final Function toggleView;
  SignUpPage({this.toggleView});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthService _auth = AuthService(); //Instancia Servicio Auth
  final _formKey =
      GlobalKey<FormState>(); //identificar el formulario y ascoiarlo
  // text field state
  String _email = '';
  String _nombre = '';
  String _password = '';
  String _genero = '';
  String _edad = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignUp(),
        child: Stack(
          children: <Widget>[
            _getHeader(),
            Positioned(
              top: 45,
              left: 30,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.grey.shade700,
                onPressed: () {
                  var route =
                      MaterialPageRoute(builder: (context) => LogInPage());
                  Navigator.push(context, route);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 160),
              child: SingleChildScrollView(
                child: Form(
                    key: _formKey, //estado y validación del form
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          validator: (value) =>
                              value.isEmpty ? 'Enter a name' : null,
                          onChanged: (value) => setState(() {
                            _nombre = value;
                          }),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade600)),
                              labelText: 'Name',
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade600)),
                        ),
                        TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade600)),
                              labelText: 'Email',
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade600)),
                          onChanged: (value) => setState(() {
                            _email = value;
                          }),
                        ),
                        TextFormField(
                          validator: (value) =>
                              value.isEmpty ? 'Enter your gender' : null,
                          onChanged: (value) => setState(() {
                            _genero = value;
                          }),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade600)),
                              labelText: 'Gender',
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade600)),
                        ),
                        TextFormField(
                          validator: (value) =>
                              value.isEmpty ? 'Enter an email' : null,
                          onChanged: (value) => setState(() {
                            _edad = value;
                          }),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade600)),
                              labelText: 'Age',
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade600)),
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade600)),
                              labelText: 'Password',
                              labelStyle:
                                  TextStyle(color: Colors.grey.shade600)),
                          onChanged: (value) => setState(() {
                            _password = value;
                          }),
                        ),
                      ],
                    )),
              ),
            ),
            Container(
              alignment: Alignment(0.0, 0.3),
              child: Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
            Container(
              alignment: Alignment(0.8, 0.9),
              child: CircleAvatar(
                backgroundColor: Color(0xfff8ac6d1),
                radius: 35,
                child: IconButton(
                    icon: Icon(Icons.arrow_forward),
                    color: Colors.white,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: _email, password: _password)
                              .then((doc) {
                            dynamic result2 =
                                _auth.collection(_nombre, _genero, _edad);
                          }).then((doc) {
                            var route = MaterialPageRoute(
                                builder: (context) => MenuPage());
                            Navigator.push(context, route);
                          });
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            setState(() {
                              error = "The password provided is too weak.";
                            });
                          } else if (e.code == 'email-already-in-use') {
                            setState(() {
                              error =
                                  "The account already exists for that email.";
                            });
                          }
                          print(error);
                        } catch (e) {
                          print(e);
                        }
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_getHeader() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 70, vertical: 100),
    child: Text(
      'Create Account',
      style: TextStyle(color: Colors.grey.shade700, fontSize: 30),
    ),
  );
}

class BackgroundSignUp extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh * 0.65);
    blueWave.cubicTo(sw * 0.8, sh * 0.8, sw * 0.55, sh * 0.8, sw * 0.45, sh);
    blueWave.lineTo(0, sh);
    blueWave.close();
    paint.color = Color(0xfffbbded6);
    canvas.drawPath(blueWave, paint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.3);
    greyWave.cubicTo(sw * 0.65, sh * 0.45, sw * 0.25, sh * 0.35, 0, sh * 0.5);
    greyWave.close();
    paint.color = Color(0xffffae3d9);
    canvas.drawPath(greyWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
