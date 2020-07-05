import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class NewVideo extends StatefulWidget {
  NewVideo({Key key}) : super(key: key);

  static const routename = 'newvideo';

  @override
  _NewVideoState createState() => _NewVideoState();
}

class _NewVideoState extends State<NewVideo> {
  CameraController controller;
  List<CameraDescription> cameras;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      cameras = arguments["cameras"];
      print(cameras);
      controller = CameraController(cameras[1], ResolutionPreset.medium);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !controller.value.isInitialized
          ? Container()
          : AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: CameraPreview(controller)),
    );
  }
}
