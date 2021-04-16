import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:health_app/src/pages/home/menu_page.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      CustomBody(),
      NavBar(),
      Container(
          padding: EdgeInsets.only(top: 90),
          child: StaggeredGridView.count(
            padding: const EdgeInsets.all(12),
            primary: false,
            crossAxisCount: 4,
            staggeredTiles: const <StaggeredTile>[
              StaggeredTile.fit(2),
              StaggeredTile.fit(2),
              StaggeredTile.fit(1),
              StaggeredTile.fit(3),
              StaggeredTile.fit(3),
              StaggeredTile.fit(1),
              StaggeredTile.fit(2),
              StaggeredTile.fit(2),
            ],
            children: const <Widget>[
              _Tile(1),
              _Tile(2),
              _Tile(3),
              _Tile(4),
              _Tile(5),
              _Tile(6),
              _Tile(7),
              _Tile(8),
            ],
          )),
    ]));
  }
}

class _Tile extends StatelessWidget {
  const _Tile(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                Text(
                  'Note $index',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Content',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
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
            text: 'Notes',
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