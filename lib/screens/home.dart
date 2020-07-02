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
        ],
      ),
    );
  }
}
