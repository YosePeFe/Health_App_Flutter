import 'package:flutter/material.dart';
import 'package:health_app/src/pages/home/menu_page.dart';
import 'package:health_app/src/services/authservice.dart';

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
            Positioned(
              top: 35,
              left: 25,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.grey.shade700,
                onPressed: () {
                  widget.toggleView();
                  /* var route = MaterialPageRoute(builder: (context) => LogInPage());
                  Navigator.push(context, route); */
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: <Widget>[
                  /* buildNumberRow(context), */
                  _getHeader(),
                  Expanded(
                      flex: 6,
                      child: SingleChildScrollView(
                        child: Form(
                            key: _formKey, //estado y validación del form
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  onChanged: (value) => setState(() {
                                    _nombre = value;
                                  }),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade600)),
                                      labelText: 'Name',
                                      labelStyle: TextStyle(
                                          color: Colors.grey.shade600)),
                                ),
                                TextFormField(
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter an email' : null,
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade600)),
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                          color: Colors.grey.shade600)),
                                  onChanged: (value) => setState(() {
                                    _email = value;
                                  }),
                                ),
                                TextFormField(
                                  onChanged: (value) => setState(() {
                                    _genero = value;
                                  }),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade600)),
                                      labelText: 'Gender',
                                      labelStyle: TextStyle(
                                          color: Colors.grey.shade600)),
                                ),
                                TextField(
                                  onChanged: (value) => setState(() {
                                    _edad = value;
                                  }),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade600)),
                                      labelText: 'Age',
                                      labelStyle: TextStyle(
                                          color: Colors.grey.shade600)),
                                ),
                                TextFormField(
                                  validator: (val) => val.length < 6
                                      ? 'Enter a password 6+ chars long'
                                      : null,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade600)),
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                          color: Colors.grey.shade600)),
                                  onChanged: (value) => setState(() {
                                    _password = value;
                                  }),
                                ),
                              ],
                            )),
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment(1.0, 0.7),
                      child: CircleAvatar(
                        backgroundColor: Color(0xfff8ac6d1),
                        radius: 35,
                        child: IconButton(
                            icon: Icon(Icons.arrow_forward),
                            color: Colors.white,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                dynamic result =
                                    await _auth.createUserWithEmailAndPassword(
                                        _email, _password);
                                dynamic result2 = await _auth.collection(
                                    _nombre, _genero, _edad);
                                var route = MaterialPageRoute(
                                    builder: (context) => MenuPage());
                                Navigator.push(context, route);
                              }
                            }
                            /* onPressed: () {
                            var route = MaterialPageRoute(
                                builder: (context) => MenuPage());
                            Navigator.push(context, route);
                          }, */
                            ),
                      ),
                    ),
                  )
                  /* _getTextFields(), */
                  /* _genderRadio(groupValue, handleRadioValueChanged), */
                  /* _getSignIn(context), */
                  /* _getBottomRow(context), */
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* _getBackBtn(BuildContext context) {
  return Positioned(
    top: 35,
    left: 25,
    child: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: Colors.grey.shade700,
      onPressed: () {
        /* var route = MaterialPageRoute(builder: (context) => LogInPage());
        Navigator.push(context, route); */
      },
    ),
  );
} */

/* _getBottomRow(context) {
  return Expanded(
    flex: 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
                  child: Text(
            'Sign up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        Text(
          '',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    ), 
  );
}*/

/* _getSignIn(BuildContext context) {
  return Expanded(
    flex: 5,
    child: Container(
      alignment: Alignment(1.0, 0.7),
      child: CircleAvatar(
        backgroundColor: Color(0xfff8ac6d1),
        radius: 35,
        child: IconButton(
          icon: Icon(Icons.arrow_forward),
          color: Colors.white,
          onPressed: () {
            var route = MaterialPageRoute(builder: (context) => MenuPage());
            Navigator.push(context, route);
          },
        ),
      ),
    ),
  );
} */

/* _getTextFields() {
  /* var age = 25; */
  return Expanded(
      flex: 6,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.grey.shade600)),
            ),
            TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  labelText: 'Gender',
                  labelStyle: TextStyle(color: Colors.grey.shade600)),
            ),
            TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  labelText: 'Age',
                  labelStyle: TextStyle(color: Colors.grey.shade600)),
            ),
            TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  labelText: 'User Name',
                  labelStyle: TextStyle(color: Colors.grey.shade600)),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey.shade600)),
            ),
          ],
        ),
      ));
} */
/* Row buildNumberRow (BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150.0,
          child: ElevatedButton(
            child: Text("Number Picker"),
            onPressed: () => showMaterialNumberPicker(
              context: context,
              title: "Pick a Number",
              maxNumber: 100,
              minNumber: 15,
              step: 5,
              confirmText: "Count me in",
              cancelText: "Negatory",
              selectedNumber: age,
              onChanged: (value) => setState(() => age = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            model.age.toString(),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }, */

/* _genderRadio(int groupValue, handleRadioValueChanged) =>
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
      Text(
        'Gender',
        style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      Row(
        children: <Widget>[
          Radio(
              value: 0,
              groupValue: groupValue,
              onChanged: handleRadioValueChanged),
          Text(
            "Male",
            style: new TextStyle(
              fontSize: 14.0,
            ),
          ),
          Radio(
              value: 1,
              groupValue: groupValue,
              onChanged: handleRadioValueChanged),
          Text(
            "Male",
            style: new TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      )
    ]); */

_getHeader() {
  return Expanded(
    flex: 4,
    child: Container(
      alignment: Alignment.bottomLeft,
      child: Text(
        'Create Account',
        style: TextStyle(color: Colors.grey.shade700, fontSize: 40),
      ),
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
