import 'package:flutter/material.dart';

class VideoGrid extends StatefulWidget {
  VideoGrid({Key key}) : super(key: key);

  @override
  _VideoGridState createState() => _VideoGridState();
}

class _VideoGridState extends State<VideoGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 16/9,
        ),
        itemCount: 8,
        itemBuilder: (context, i) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text('hi'),
        ),
      ),
    );
  }
}
