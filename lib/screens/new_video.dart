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
      backgroundColor: Colors.black,
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
          : SafeArea(
              child: Stack(
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
                  // Positioned(
                  //   bottom: 0,
                  //   right: 0,
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                  //     child: IconButton(
                  //       icon: Icon(
                  //         Icons.switch_camera,
                  //         size: 30,
                  //       ),
                  //       onPressed: () {
                  //         setState(() {
                  //           isFront = !isFront;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                      child: IconButton(
                        icon: Icon(
                          Icons.photo,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isFront = !isFront;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top,
                    right: 10,
                    child: ControlBar(),
                  ),
                  SpeedControlBar(),
                ],
              ),
            ),
    );
  }
}

class ControlBar extends StatelessWidget {
  const ControlBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IconButton(
            icon: Icon(
              Icons.switch_camera,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shutter_speed,
              size: 30,
            ),
            // TODO Speed
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.filter_vintage,
              size: 30,
              // TODO Filters
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.face,
              size: 30,
            ),
            // TODO Beautify
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.timer_3,
              size: 30,
            ),
            // TODO Timer
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.flash_on,
              size: 30,
            ),
            // TODO Flash
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class SpeedControlBar extends StatelessWidget {
  const SpeedControlBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 150,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpeedControlBoxes(
              title: '0.25x',
            ),
            SpeedControlBoxes(
              title: '0.5x',
            ),
            SpeedControlBoxes(
              title: '1x',
            ),
            SpeedControlBoxes(
              title: '1.5x',
            ),
            SpeedControlBoxes(
              title: '2x',
            ),
          ],
        ),
      ),
    );
  }
}

class SpeedControlBoxes extends StatelessWidget {
  const SpeedControlBoxes({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Container(
          // color: Colors.red,
          child: Text(title),
        ),
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
