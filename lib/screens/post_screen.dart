import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_alt/provider/storage_provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final storage = Provider.of<StorageProvider>(context, listen: false);

    File _image;
    final picker = ImagePicker();

    Future getImage() async {
      final pickedFile = await picker.getVideo(source: ImageSource.gallery);

      setState(() {
        _image = File(pickedFile.path);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: SafeArea(
        child: Container(
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
                onPressed: () {
                  getImage();
                },
                child: Text('Add Files'),
              ),
              FlatButton(
                onPressed: () {
                  storage.uploadImage(_image);
                },
                child: Text('Post Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
