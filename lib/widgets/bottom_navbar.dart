import 'package:camera/camera.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_alt/screens/home_pageview.dart';
import 'package:tiktok_alt/screens/new_video.dart';

class BottomNavBarHome extends StatefulWidget {
  BottomNavBarHome({Key key, this.pageController});
  // final int active;
  final PageController pageController;
  @override
  _BottomNavBarHomeState createState() => _BottomNavBarHomeState();
}

class MenuItem {
  final String name;
  final Color color;
  final double x;
  MenuItem({this.name, this.color, this.x});
}

class _BottomNavBarHomeState extends State<BottomNavBarHome> {
  List items = [
    MenuItem(x: -1.0, name: 'house', color: Colors.lightBlue[100]),
    MenuItem(x: -0.5, name: 'planet', color: Colors.purple),
    MenuItem(x: 0.0, name: 'camera', color: Colors.greenAccent),
    MenuItem(x: 0.5, name: 'heart', color: Colors.pink),
    MenuItem(x: 1.0, name: 'head', color: Colors.yellow),
  ];

  MenuItem active;

  @override
  void initState() {
    super.initState();

    // active = items[0];

    // active = items[widget.pageController.page.round()];
    if (page < 2)
      active = items[page];
    else
      active = items[page + 1];
  }

  @override
  Widget build(BuildContext context) {
    // active = items[widget.pageController.page.round()];

    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      color: Colors.black,
      width: w,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            alignment: Alignment(active.x, -1),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: 8,
              width: w * 0.2,
              color: active.color,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((k) {
                return _flare(k);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _flare(MenuItem item) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: FlareActor(
            'assets/flare/${item.name}.flr',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: item.name == active.name ? 'go' : 'idle',
          ),
        ),
      ),
      onTap: () {
        setState(() {
          active = item;
          if (active.x == -1)
            widget.pageController.animateToPage(
              0,
              duration: Duration(milliseconds: 1000),
              curve: Curves.fastOutSlowIn,
            );
          else if (active.x == -0.5)
            widget.pageController.animateToPage(
              1,
              duration: Duration(milliseconds: 1000),
              curve: Curves.fastOutSlowIn,
            );
          else if (active.x == 0) {
            goToNewVideo();
          } else if (active.x == 0.5)
            widget.pageController.animateToPage(
              2,
              duration: Duration(milliseconds: 1000),
              curve: Curves.fastOutSlowIn,
            );
          else if (active.x == 1)
            widget.pageController.animateToPage(
              3,
              duration: Duration(milliseconds: 1000),
              curve: Curves.fastOutSlowIn,
            );
        });
      },
    );
  }

  goToNewVideo() async {
    List<CameraDescription> cameras = await availableCameras();
    Navigator.pushNamed(
      context,
      NewVideo.routename,
      arguments: {"cameras": cameras},
    );
  }
}
