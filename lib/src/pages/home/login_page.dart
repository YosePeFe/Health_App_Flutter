import 'package:flutter/material.dart';
import 'package:health_app/src/pages/home/signup_page.dart';
import 'package:health_app/src/services/authservice.dart';

import 'menu_page.dart';

class LogInPage extends StatefulWidget {
  /* final Function toggleView;
  LogInPage({this.toggleView}); */

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final AuthService _auth = AuthService(); //Instancia Servicio Auth
  final _formKey = GlobalKey<FormState>();

  // text field state
  String _email = '';
  String _password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: <Widget>[
                  _getHeader(),
                  Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                          child: Form(
                              key: _formKey,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 160,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration:
                                          InputDecoration(labelText: 'Email'),
                                      onChanged: (value) => setState(() {
                                        _email = value;
                                      }),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          labelText: 'Password'),
                                      onChanged: (value) => setState(() {
                                        _password = value;
                                      }),
                                    ),
                                  ])))),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Log in',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade800),
                          ),
                          CircleAvatar(
                              backgroundColor: Color(0xfff8ac6d1),
                              radius: 35,
                              child: IconButton(
                                  icon: Icon(Icons.arrow_forward),
                                  color: Colors.white,
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      dynamic result = await _auth
                                          .signInWithEmailAndPassword(
                                              _email, _password);
                                      var route = MaterialPageRoute(
                                          builder: (context) => MenuPage());
                                      Navigator.push(context, route);
                                      /* if (result == null) {
                                        setState(() =>
                                            error = 'No se pudo ingresar');
                                      } */
                                    }
                                  })),
                        ],
                      )),
                  /* _getSignIn(context), */
                  /* _getBottomRow(context), */
                  Expanded(
                      flex: 1,
                      child: Container(
                        alignment: FractionalOffset(-0.06, 0.5),
                        child: TextButton(
                          child: Text('Sign Up Now',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              )),
                          onPressed: () {
                            var route = MaterialPageRoute(
                                builder: (context) => SignUpPage());
                            Navigator.push(context, route);
                          },
                          /* var route = MaterialPageRoute(builder: (context) => LogInPage());
                  Navigator.push(context, route); */
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(height: 30.0)
          ],
        ),
      ),
    );
  }
}

/* _getBottomRow(context) {
  return Expanded(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.grey.shade700,
          onPressed: () {
            /* var route = MaterialPageRoute(builder: (context) => LogInPage());
                  Navigator.push(context, route); */
          },
        ),
      ],
    ),
  );
} */

/* _getSignIn(BuildContext context) {
  final AuthService _auth = AuthService(); //Instancia Servicio Auth
  String email = '';
  String password = '';
  return Expanded(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Log in',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade800),
        ),
        CircleAvatar(
          backgroundColor: Color(0xfff8ac6d1),
          radius: 35,
          child: IconButton(
              icon: Icon(Icons.arrow_forward),
              color: Colors.white,
              onPressed: () async {
                print(email);
                print(password);
              }
              /* onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if (result == null) {
                  print('error signing in');
                } else {
                  print('signed in');
                  print(result.uid);
                }
              } */
              /* onPressed: () {
              var route = MaterialPageRoute(builder: (context) => MenuPage());
              Navigator.push(context, route);
            }, */
              ),
        )
      ],
    ),
  );
} */

/* _getTextFields() {
  String email = '';
  String password = '';
  return Expanded(
      flex: 4,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'User Name'),
              onChanged: (val) {
                setState(() => email = val);
              },
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ));
} */

_getHeader() {
  return Container(
      child: Container(
          alignment: Alignment(0.0, -0.6),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Welcome Back\n',
                  style: TextStyle(
                      color: Colors.grey.shade700, fontSize: 40, height: 4),
                ),
                TextSpan(
                  text: 'Keep taking care \nof yourself',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 30),
                ),
                TextSpan(text: '', style: TextStyle(color: Colors.blue[300])),
              ],
            ),
          )));
}

class BackgroundSignIn extends CustomPainter {
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
    blueWave.lineTo(sw, sh * 0.5);
    blueWave.quadraticBezierTo(sw * 0.5, sh * 0.45, sw * 0.2, 0);
    blueWave.close();
    paint.color = Color(0xfffbbded6);
    canvas.drawPath(blueWave, paint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.1);
    greyWave.cubicTo(
        sw * 0.95, sh * 0.15, sw * 0.65, sh * 0.15, sw * 0.6, sh * 0.38);
    greyWave.cubicTo(sw * 0.52, sh * 0.52, sw * 0.05, sh * 0.45, 0, sh * 0.4);
    greyWave.close();
    paint.color = Color(0xfffae3d9);
    canvas.drawPath(greyWave, paint);

    Path yellowWave = Path();
    yellowWave.lineTo(sw * 0.7, 0);
    yellowWave.cubicTo(
        sw * 0.6, sh * 0.05, sw * 0.27, sh * 0.01, sw * 0.18, sh * 0.12);
    yellowWave.quadraticBezierTo(sw * 0.12, sh * 0.2, 0, sh * 0.2);
    yellowWave.close();
    paint.color = Color(0xfffffb6b9);
    canvas.drawPath(yellowWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
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
    paint.color = Colors.lightBlue.shade300;
    canvas.drawPath(blueWave, paint);

    Path greyWave = Path();
    greyWave.lineTo(sw, 0);
    greyWave.lineTo(sw, sh * 0.3);
    greyWave.cubicTo(sw * 0.65, sh * 0.45, sw * 0.25, sh * 0.35, 0, sh * 0.5);
    greyWave.close();
    paint.color = Colors.grey.shade800;
    canvas.drawPath(greyWave, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
