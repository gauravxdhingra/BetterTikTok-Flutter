import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Following',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Container(
                        height: 5,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 3,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'For you',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Container(
                        height: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 150,
            child: Container(
              child: Text('@user'),
            ),
          ),
          Positioned(
            bottom: 120,
            child: Container(
              child: Text('Caption'),
            ),
          ),
          Positioned(
            bottom: 70,
            child: Container(
              child: Text('Audio'),
            ),
          ),
          Positioned(
            // TODO: Add Text Counter under all icons
            bottom: 80,
            right: 5,
            child: Column(
              children: [
                SideActionIcons(
                  icon: Icons.account_circle,
                  count: '100',
                  action: () {},
                ),
                SizedBox(
                  height: 12,
                ),
                SideActionIcons(
                  icon: Icons.favorite,
                  count: '100',
                  action: () {},
                ),
                SizedBox(
                  height: 12,
                ),
                SideActionIcons(
                  icon: Icons.message,
                  count: '100',
                  action: () {},
                ),
                SizedBox(
                  height: 12,
                ),
                SideActionIcons(
                  icon: Icons.share,
                  count: '100',
                  action: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 25,
                  child: Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SideActionIcons extends StatelessWidget {
  const SideActionIcons({
    Key key,
    this.icon,
    this.count,
    this.action,
  }) : super(key: key);

  final IconData icon;
  final String count;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon),
          color: Colors.white,
          iconSize: 40,
          onPressed: action,
          padding: EdgeInsets.all(0),
        ),
        Text(count),
      ],
    );
  }
}
