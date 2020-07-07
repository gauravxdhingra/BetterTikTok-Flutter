import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class NewVideo extends StatefulWidget {
  NewVideo({Key key}) : super(key: key);

  static const routename = 'newvideo';

  @override
  _NewVideoState createState() => _NewVideoState();
}

class _NewVideoState extends State<NewVideo> {
  CameraController controllerFront;
  // CameraController controllerBack;
  List<CameraDescription> cameras;
  bool isFront = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      cameras = arguments["cameras"];
      print(cameras);
      controllerFront = CameraController(cameras[1], ResolutionPreset.veryHigh);
      controllerFront.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
      // controllerBack = CameraController(cameras[0], ResolutionPreset.veryHigh);
      // controllerBack.initialize().then((_) {
      //   if (!mounted) {
      //     return;
      //   }
      //   setState(() {});
      // });
    });
  }

  @override
  void dispose() {
    // controllerBack?.dispose();
    controllerFront?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !controllerFront.value.isInitialized
          // &&
          //         !controllerBack.value.isInitialized
          ? Container(
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.switch_camera),
                  onPressed: () {
                    setState(() {
                      isFront = !isFront;
                    });
                    // if(controller.)
                    // print(controller.description.lensDirection);
                    // if (controller.description.lensDirection
                    //     .toString()
                    //     .contains("front")) {
                    //   controller = CameraController(
                    //     cameras[0],
                    //     ResolutionPreset.veryHigh,
                    //   );
                    //   setState(() {});
                    // } else {
                    //   controller = CameraController(
                    //     cameras[1],
                    //     ResolutionPreset.veryHigh,
                    //   );
                    //   setState(() {});
                    // }
                  },
                ),
              ),
            )
          : Stack(
              children: [
                AspectRatio(
                  aspectRatio:
                      // isFront
                      //     ?
                      controllerFront.value.aspectRatio
                  // : controllerBack.value.aspectRatio
                  ,
                  child:
                      // isFront
                      //     ?
                      CameraPreview(controllerFront)
                  // : CameraPreview(controllerBack)
                  ,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: RecordButton(),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.switch_camera),
                    onPressed: () {
                      setState(() {
                        isFront = !isFront;
                      });
                    },
                  ),
                )
              ],
            ),
    );
  }
}

class RecordButton extends StatelessWidget {
  const RecordButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 50,
      ),
    );
  }
}
