import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:health_app/src/pages/home/menu_page.dart';

List<Song> songs = [
  Song('Behaviour of the mind', '3:25'),
  Song('Your inner voice', '2:41'),
  Song('Embrace your emotions', '3:16'),
  Song('Letting go everything', '3:38'),
  Song('Feel the sky', '2:56'),
  Song('Go beyond the form', '3:24'),
  Song('Love the feelings', '3:44'),
];

class Song {
  final String name;
  final String time;

  Song(this.name, this.time);
}

class MeditationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            CustomBody(),
            CustomBottomBar(),
            PlayButton(),
          ],
        ),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      child: IgnorePointer(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.white.withOpacity(0.01),
                  ],
                ),
              ),
            ),
            ClipPath(
              clipper: BottomBarClipper(),
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xfff8ac6d1),
                      Color(0xfff8ac6d1),
                      Color(0xfffbbded6),
                      Color(0xfffbbded6),
                      Color(0xfff8ac6d1),
                      Color(0xfff8ac6d1),
                      /* Colors.blueGrey.shade800,
                      Colors.blueGrey.shade800,
                      Colors.blue.shade800,
                      Colors.blue.shade300,
                      Colors.blueGrey.shade800,
                      Colors.blueGrey.shade800, */
                    ],
                  ),
                ),
                child: ClipPath(
                  clipper: BottomBarClipper(),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: double.infinity,
                    padding: EdgeInsets.only(bottom: 15),
                    color: Colors.grey.shade50,
                    /* decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.blueGrey.shade100,
                          Colors.blueGrey.shade100,
                          Colors.blueGrey.shade100,
                          Colors.blueGrey.shade100,
                        ],
                      ),
                    ), */
                    /* child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('2.30', style:TextStyle(color: Colors.black38, fontWeight: FontWeight.w500,),),
                        Text('Rainforest - Relaxing', style:TextStyle(color: Colors.black87, fontWeight: FontWeight.w500,),),
                        Text('-0.50', style:TextStyle(color: Colors.black38, fontWeight: FontWeight.w500,),),
                      ],
                    ), */
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 55,
      left: MediaQuery.of(context).size.width / 2 - 30,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xfff8ac6d1),
              Color(0xfffbbded6),
              /* Colors.blueGrey.shade900,
              Colors.blue.shade700, */
            ],
          ),
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.play_arrow,
              color: Colors.white.withOpacity(0.9), size: 40),
        ),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double listheight = (50 * songs.length).toDouble();
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CustomHeader(),
          Container(
            height: listheight,
            padding: EdgeInsets.symmetric(horizontal: 35),
            margin: EdgeInsets.only(bottom: 120),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: songs.length,
              itemExtent: 45,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(
                    index == 0 ? Icons.play_arrow : Icons.lock_outline,
                    size: 22),
                title: Text(songs[index].name, style: TextStyle(fontSize: 14)),
                trailing:
                    Text(songs[index].time, style: TextStyle(fontSize: 14)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        HeaderBackground(),
        Container(
          alignment: Alignment.center,
          height: 400,
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      var route =
                          MaterialPageRoute(builder: (context) => MenuPage());
                      Navigator.push(context, route);
                    },
                  ),
                  /* IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.white54,
                    ),
                    onPressed: () {},
                  ), */
                ],
              ),
              SizedBox(height: 25),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Meditation',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              '\n \nWhen you own your breath, \nnobody can steal your peace',
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade100))
                    ]),
              ),
              Spacer(),
            ],
          ),
        ),
        Container(
          width: 150,
          height: 150,
          margin: EdgeInsets.only(top: 240),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/meditate.jpg')),
            borderRadius: BorderRadius.circular(35),
          ),
        )
      ],
    );
  }
}

class HeaderBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        /* Container(
          width: 150,
          height: 150,
          margin: EdgeInsets.only(top: 275),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 100,
                spreadRadius: 20,
                color: Colors.blueGrey.shade800)
          ]),
        ), */
        ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            margin: EdgeInsets.only(top: 5),
            height: 250,
            color: Colors.white,
          ),
        ),
        ClipPath(
          clipper: HeaderClipper(),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/meditation.jpg'),
                  fit: BoxFit.cover),
            ),
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white10.withOpacity(0.0)),
              ),
            ),
          ),
        ),
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

class BottomBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var sw = size.width;
    var sh = size.height;

    path.lineTo(4 * sw / 12, 0);
    path.cubicTo(
        5 * sw / 12, 0, 5 * sw / 12, 2 * sh / 5, 6 * sw / 12, 2 * sh / 5);
    path.cubicTo(7 * sw / 12, 2 * sh / 5, 7 * sw / 12, 0, 8 * sw / 12, 0);
    path.lineTo(sw, 0);
    path.lineTo(sw, sh);
    path.lineTo(0, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
