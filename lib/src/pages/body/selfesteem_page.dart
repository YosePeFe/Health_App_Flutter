import 'package:flutter/material.dart';
import 'package:health_app/src/pages/home/menu_page.dart';
import 'package:video_player/video_player.dart';

class SelfesteemPage extends StatefulWidget {
  @override
  _SelfesteemPageState createState() => _SelfesteemPageState();
}

class _SelfesteemPageState extends State<SelfesteemPage> {
  final asset = 'assets/video.mp4';
  VideoPlayerController _controller;
  VideoPlayerController _controller2;
  VideoPlayerController _controller3;
  VideoPlayerController _controller4;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video_1.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller2 = VideoPlayerController.asset('assets/video_2.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller3 = VideoPlayerController.asset('assets/video_3.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller4 = VideoPlayerController.asset('assets/video_4.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      CustomBody(),
      NavBar(),
      Stack(
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
            SizedBox(
              height: 80,
            ),
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
                          Container(
                            width: 300,
                            child: _controller.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: VideoPlayer(_controller),
                                  )
                                : Container(),
                          ),
                        ],
                      )),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    subtitle: Text(
                      'Autoestima',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
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
                          Container(
                            width: 300,
                            child: _controller2.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: _controller2.value.aspectRatio,
                                    child: VideoPlayer(_controller2),
                                  )
                                : Container(),
                          ),
                        ],
                      )),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () {
                      setState(() {
                        _controller2.value.isPlaying
                            ? _controller2.pause()
                            : _controller2.play();
                      });
                    },
                    child: Icon(
                      _controller2.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    subtitle: Text(
                      '¿Qué es el Autoestima?',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
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
                          Container(
                            width: 300,
                            child: _controller3.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: _controller3.value.aspectRatio,
                                    child: VideoPlayer(_controller3),
                                  )
                                : Container(),
                          ),
                        ],
                      )),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () {
                      setState(() {
                        _controller3.value.isPlaying
                            ? _controller3.pause()
                            : _controller3.play();
                      });
                    },
                    child: Icon(
                      _controller3.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 25, 0),
                    subtitle: Text(
                      'Mensaje para reflexionar (Michael Ronda - Es Posible)',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
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
                          Container(
                            width: 300,
                            child: _controller4.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: _controller4.value.aspectRatio,
                                    child: VideoPlayer(_controller4),
                                  )
                                : Container(),
                          ),
                        ],
                      )),
                  ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () {
                      setState(() {
                        _controller4.value.isPlaying
                            ? _controller4.pause()
                            : _controller4.play();
                      });
                    },
                    child: Icon(
                      _controller4.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 25, 0),
                    subtitle: Text(
                      'Si pudieras cambiar una sola parte de tu cuerpo - ¿Qué cambiarias?',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            )),
          ]))),
        ],
      )
    ]));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

@override
Widget build(BuildContext context) {
  return Stack(
    children: [
      Column(children: [
        SizedBox(
          height: 80,
        ),
        Container(
            child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                  '"You yourself, as much as anybody in the entire universe, deserve your love and affection." -- Buddha',
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
        Container(
            child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
