import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:health_app/src/pages/home/menu_page.dart';

class InspirationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
          centerTitle: false,
          title: Text('Inspiration'),
          backgroundColor: Color(0xfff8ac6d1),
        ), */
      body: Stack(
        children: <Widget>[CustomBody(), _swiperTarjetas(context), NavBar()],
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
                text: 'Inspiration',
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

_swiperTarjetas(BuildContext context) {
  final _screenSize = MediaQuery.of(context).size;
  final List<dynamic> quotes = [
    "https://bit.ly/2REuZ9z",
    "https://bit.ly/3scQISs",
    "https://bit.ly/3wVfQR4",
    "https://bit.ly/32eo1dh",
    "https://bit.ly/3gewy8a",
    "https://bit.ly/3uPEosX",
    "https://bit.ly/3x64rya",
    "https://bit.ly/3uJVnge",
    "https://bit.ly/3dZwGG4",
    "https://bit.ly/3tlUF8F",
    "https://bit.ly/3too0zm",
    "https://bit.ly/3wXq4k8",
    "https://bit.ly/3dibsnx",
    "https://bit.ly/32c9puU"
  ];

  return Column(children: [
    SizedBox(height: 140),
    Swiper(
      /* future: Future.value(
            quotes.map((item) => Image((item))).toList()
          ), */
      layout: SwiperLayout.STACK,
      itemWidth: _screenSize.width * 0.85,
      itemHeight: _screenSize.height * 0.65,
      /* FutureBuilder(
            future: Future.value(),
            initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return ;
            },
          ), */
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(quotes[index], fit: BoxFit.fill));
      },
      itemCount: quotes.length,
    )
  ]);
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
