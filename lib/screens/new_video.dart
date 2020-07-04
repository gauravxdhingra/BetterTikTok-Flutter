import 'package:flutter/material.dart';

class NewVideo extends StatefulWidget {
  NewVideo({Key key}) : super(key: key);

  static const routename = 'newvideo';

  @override
  _NewVideoState createState() => _NewVideoState();
}

class _NewVideoState extends State<NewVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("New Video"),
    );
  }
}
