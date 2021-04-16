import 'package:flutter/material.dart';
import 'login_page.dart';
import 'menu_page.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';


class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BackgroundSignUp(),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: <Widget>[
                  /* buildNumberRow(context), */
                  _getHeader(),
                  _getTextFields(),
                  /* _genderRadio(groupValue, handleRadioValueChanged), */
                  _getSignIn(context),
                  /* _getBottomRow(context), */
                ],
              ),
            ),
            _getBackBtn(context)
          ],
        ),
      ),
    );
  }
}

_getBackBtn(BuildContext context) {
  return Positioned(
    top: 35,
    left: 25,
    child: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      color: Colors.grey.shade700,
      onPressed: () {
        var route = MaterialPageRoute(builder: (context) => LogInPage());
        Navigator.push(context, route);
      },
    ),
  );
}

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

_getSignIn(BuildContext context) {
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
}

_getTextFields() {
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
}

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
