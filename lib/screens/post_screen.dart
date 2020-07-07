import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              color: Colors.red,
            ),
            TextFormField(),
            TextFormField(),
            FlatButton(
              onPressed: () {},
              child: Text('Post Now'),
            ),
          ],
        ),
      ),
    );
  }
}
