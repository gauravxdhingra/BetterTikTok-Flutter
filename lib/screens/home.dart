import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
                        'For You',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Container(
                        height: 5,
                      ),
                      // CircleAvatar(
                      //   backgroundColor: Colors.blue,
                      //   radius: 3,
                      // ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 150,
            child: Container(
              child: Text('User'),
            ),
          ),
          Positioned(
            bottom: 120,
            child: Container(
              child: Text('Caption'),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              child: Text('Audio'),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 7,
            child: Column(
              children: [
                Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  height: 12,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  height: 12,
                ),
                Icon(
                  Icons.message,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  height: 12,
                ),
                Icon(
                  Icons.share,
                  color: Colors.white,
                  size: 40,
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
