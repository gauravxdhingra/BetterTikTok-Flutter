import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class NewVideo extends StatefulWidget {
  NewVideo({Key key}) : super(key: key);

  static const routename = 'newvideo';

  @override
  _NewVideoState createState() => _NewVideoState();
}

int selected = 1;

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
      controllerFront =
          CameraController(cameras[1], ResolutionPreset.ultraHigh);
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
    if (controllerFront != null)
      return Scaffold(
        backgroundColor: Colors.black,
        body: !controllerFront.value.isInitialized
            ? Container(
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.switch_camera),
                    onPressed: () {
                      setState(() {
                        isFront = !isFront;
                      });
                    },
                  ),
                ),
              )
            : SafeArea(
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: controllerFront.value.aspectRatio,
                      child: CameraPreview(controllerFront),
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
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(),
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

class SpeedControlBar extends StatefulWidget {
  const SpeedControlBar({
    Key key,
  }) : super(key: key);

  @override
  _SpeedControlBarState createState() => _SpeedControlBarState();
}

class _SpeedControlBarState extends State<SpeedControlBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 150,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpeedControlBoxes(
                  title: '0.25x',
                  selectedd: 25,
                  onSpeed: () {
                    selected = 25;
                    setState(() {});
                  },
                ),
                SpeedControlBoxes(
                  title: '0.5x',
                  selectedd: 5,
                  onSpeed: () {
                    selected = 5;
                    setState(() {});
                  },
                ),
                SpeedControlBoxes(
                  title: '1x',
                  selectedd: 1,
                  onSpeed: () {
                    selected = 1;
                    setState(() {});
                  },
                ),
                SpeedControlBoxes(
                  title: '1.5x',
                  selectedd: 15,
                  onSpeed: () {
                    selected = 15;
                    setState(() {});
                  },
                ),
                SpeedControlBoxes(
                  title: '2x',
                  selectedd: 2,
                  onSpeed: () {
                    selected = 2;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SpeedControlBoxes extends StatelessWidget {
  const SpeedControlBoxes({
    Key key,
    this.title,
    this.selectedd,
    this.onSpeed,
  }) : super(key: key);

  final String title;
  final int selectedd;
  final Function onSpeed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.selectedd == selected ? Colors.red : null,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GestureDetector(
          child: Container(
            child: Text(title),
          ),
          onTap: onSpeed,
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
        radius: 40,
      ),
    );
  }
}
