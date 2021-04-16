import 'package:flutter/material.dart';
import 'package:health_app/src/pages/home/menu_page.dart';

class SelfesteemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[CustomBody(), NavBar(), VideoPlayer()]));
  }
}

class VideoPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /* Padding(padding: EdgeInsets.only(left: 40.0)), */
        /* SingleChildScrollView( */
          Column(children: [          
            SizedBox(height: 80,),
            Container(
                child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(25),
              elevation: 10,
              child: Column(
                children: <Widget>[
                  /* Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/meditate.jpg'),
                    fit: BoxFit.cover),
                border: Border.all(
                  color: Colors.white,
                  width: 8,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(9.0),
            ), */
                  Container(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.play_circle_outline_rounded,
                            color: Color(0xfff8ac6d1),
                            size: 100,
                          ),
                        ],
                      )),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 25, 0),
                    title: Text(
                      'Self-Esteem',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      '"You yourself, as much as anybody in the entire universe, deserve your love and affection." -- Buddha',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                  /* Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(onPressed: () => {}, child: Text('Aceptar')),
                TextButton(onPressed: () => {}, child: Text('Cancelar'))
              ],
            ) */
                ],
              ),
            )),
            Container(
                child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(25),
              elevation: 10,
              child: Column(
                children: <Widget>[
                  Container(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.play_circle_outline_rounded,
                            color: Color(0xfff8ac6d1),
                            size: 100,
                          ),
                        ],
                      )),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 25, 0),
                    title: Text(
                      'Self-Esteem',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      '"Too many people overvalue what they are not and undervalue what they are." -- Malcolm S. Forbes',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            )),
            
          ]),
        
      ],
    );
  }
}

class CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            color: Color(0xfffbbded6),
            height: 400,
          ),
        ),
        Positioned(
            top: 40,
            right: 25,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Self-Esteem',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            )),
        Positioned(
          top: 35,
          left: 25,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              var route = MaterialPageRoute(builder: (context) => MenuPage());
              Navigator.push(context, route);
            },
          ),
        ),
      ],
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: NavBarClipper(),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: Color(0xfffae3d9),
              ),
            )),
        Positioned(
          bottom: 10,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        )
      ],
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.lineTo(sw, 0);
    path.lineTo(sw, sh);
    path.cubicTo(sw, sh * 0.7, 0, sh * 0.8, 0, sh * 0.55);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.cubicTo(sw / 12, 0, sw / 12, 2 * sh / 5, 2 * sw / 12, 2 * sh / 5);
    path.cubicTo(3 * sw / 12, 2 * sh / 5, 3 * sw / 12, 0, 4 * sw / 12, 0);
    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.cubicTo(
        9 * sw / 12, 0, 9 * sw / 12, 2 * sh / 5, 10 * sw / 12, 2 * sh / 5);
    path.cubicTo(11 * sw / 12, 2 * sh / 5, 11 * sw / 12, 0, sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
