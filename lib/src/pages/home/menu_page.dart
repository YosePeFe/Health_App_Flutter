import 'package:flutter/material.dart';
import 'package:health_app/src/pages/body/inspiration_page.dart';
import 'package:health_app/src/pages/body/meditation_page.dart';
import 'package:health_app/src/pages/body/notes_page.dart';
import 'package:health_app/src/pages/body/selfesteem_page.dart';
import 'package:health_app/src/pages/home/login_page.dart';
import 'package:health_app/src/services/authservice.dart';
import 'user_data_page.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomBody(),
          // CustomAppbar(),
          NavBar(),
          _getBackBtn(context),
          _getProfileBtn(context),
          _getSignOutBtn(context),
        ],
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
      color: Colors.white,
      onPressed: () {
        var route = MaterialPageRoute(builder: (context) => LogInPage());
        Navigator.push(context, route);
      },
    ),
  );
}

_getProfileBtn(BuildContext context) {
  return Positioned(
      bottom: 25,
      left: 25,
      child: CircleAvatar(
        backgroundColor: Color(0xfff8ac6d1),
        radius: 25,
        child: IconButton(
          icon: Icon(Icons.person_outline_rounded),
          color: Colors.white,
          onPressed: () {
            var route = MaterialPageRoute(builder: (context) => Home());
            Navigator.push(context, route);
          },
        ),
      ));
}

_getSignOutBtn(BuildContext context) {
  final AuthService _auth = AuthService();
  return Positioned(
      bottom: 25,
      left: 85,
      child: CircleAvatar(
        backgroundColor: Color(0xfff8ac6d1),
        radius: 25,
        child: IconButton(
            icon: Icon(Icons.login_rounded),
            color: Colors.white,
            /* onPressed: () {
            var route = MaterialPageRoute(builder: (context) => SignUpPage());
            Navigator.push(context, route);
          }, */
            onPressed: () async {
              await _auth.signOut();
            }),
      ));
}

class CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(16)),
        SizedBox(height: 15),
        ClipPath(
            clipper: HeaderClipper(),
            child: Container(
                height: 300,
                child: Center(
                    child: Column(children: [
                  SizedBox(height: 100),
                  Text('Meditation',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white))
                ])),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/menu_meditation.jpg'),
                        fit: BoxFit.cover)))),
        Column(children: [
          SizedBox(height: 500),
          Container(
              height: 280,
              child: Center(
                  child: Column(children: [
                SizedBox(height: 150),
                Text('Self-Esteem',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))
              ])),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/menu_self.jpg'),
                      fit: BoxFit.cover)))
        ]),
        Column(children: [
          SizedBox(height: 130),
          ClipPath(
              clipper: MiddClipper(),
              child: Container(
                  height: 350,
                  child: Center(
                      child: Text('Inspiration',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white))),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/menu_ins.jpg'),
                          fit: BoxFit.cover))))
        ]),
        Column(children: [
          SizedBox(height: 300),
          ClipPath(
              clipper: MiddClipper(),
              child: Container(
                  height: 350,
                  child: Center(
                      child: Text('Notes',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white))),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/menu_notes.jpg'),
                          fit: BoxFit.cover))))
        ]),
      ],
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        /*Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: NavBarClipper(),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: Color(0xff1e1e1e),
              ), 
            )),*/
        Positioned(
            top: 110,
            right: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    color: Colors.white,
                    onPressed: () {
                      var route = MaterialPageRoute(
                          builder: (context) => MeditationPage());
                      Navigator.push(context, route);
                    },
                  ),
                ),
                SizedBox(height: 130),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    color: Colors.white,
                    onPressed: () {
                      var route = MaterialPageRoute(
                          builder: (context) => InspirationPage());
                      Navigator.push(context, route);
                    },
                  ),
                ),
                SizedBox(height: 120),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    color: Colors.white,
                    onPressed: () {
                      var route =
                          MaterialPageRoute(builder: (context) => NotesPage());
                      Navigator.push(context, route);
                    },
                  ),
                ),
                SizedBox(height: 125),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    color: Colors.white,
                    onPressed: () {
                      var route = MaterialPageRoute(
                          builder: (context) => SelfesteemPage());
                      Navigator.push(context, route);
                    },
                  ),
                ),
              ],
            )),
        /* Positioned(
          bottom: 10,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Focus',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 1),
              Text(
                'Relax',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 1),
              Text(
                'sleep',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ) */
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

class MiddClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;
    path.cubicTo(0, sh * 0.3, sw, sh * 0.2, sw, sh * 0.45);
    path.lineTo(sw, sh);
    path.cubicTo(sw, sh * 0.7, 0, sh * 0.8, 0, sh * 0.55);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
/* class NavIcon extends StatelessWidget {
  final IconData icon;
  final bool active;

  const NavIcon({
    this.icon,
    this.active,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Color(0xff1e1e1e),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: active ? Colors.grey.shade100 : Colors.transparent,
        child: Icon(
          icon,
          color: active ? Colors.black87 : Colors.white,
        ),
      ),
    );
  }
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
*/
