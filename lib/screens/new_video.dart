import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

class NewVideo extends StatefulWidget {
  NewVideo({Key key}) : super(key: key);

  static const routename = 'newvideo';

  @override
  _NewVideoState createState() => _NewVideoState();
}

int selected = 1;

class _NewVideoState extends State<NewVideo> {
  CameraController controller;
  // CameraController controllerBack;
  List<CameraDescription> cameras;
  bool isFront = true;
  int selectedCameraIdx = 1;
  String videoPath;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final Map arguments = ModalRoute.of(context).settings.arguments as Map;
      cameras = arguments["cameras"];
      print(cameras);
      controller = CameraController(cameras[1], ResolutionPreset.ultraHigh);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        _onCameraSwitched(cameras[selectedCameraIdx]).then((void v) {});
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
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller != null)
      return Scaffold(
        backgroundColor: Colors.black,
        body: !controller.value.isInitialized
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
                      aspectRatio: controller.value.aspectRatio,
                      child: CameraPreview(controller),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            radius: 40,
                            child: controller != null &&
                                    controller.value.isInitialized &&
                                    !controller.value.isRecordingVideo
                                ? IconButton(
                                    icon: const Icon(Icons.videocam),
                                    color: Colors.white,
                                    onPressed: controller != null &&
                                            controller.value.isInitialized &&
                                            !controller.value.isRecordingVideo
                                        ? _onRecordButtonPressed
                                        : null,
                                  )
                                : IconButton(
                                    icon: const Icon(Icons.stop),
                                    color: Colors.white,
                                    onPressed: controller != null &&
                                            controller.value.isInitialized &&
                                            controller.value.isRecordingVideo
                                        ? _onStopButtonPressed
                                        : null,
                                  ),
                          ),
                        ),
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
                      bottom: 0,
                      right: 0,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                        child: IconButton(
                          icon: Icon(
                            Icons.switch_video,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              isFront = !isFront;
                              _onSwitchCamera();
                              // _onCameraSwitched(cameras[0]);
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

  Future<void> _onCameraSwitched(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller =
        CameraController(cameraDescription, ResolutionPreset.ultraHigh);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {}
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _onSwitchCamera() {
    selectedCameraIdx =
        (selectedCameraIdx < cameras.length - 1) ? selectedCameraIdx + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIdx];

    _onCameraSwitched(selectedCamera);

    setState(() {
      selectedCameraIdx = selectedCameraIdx;
    });
  }

  void _onRecordButtonPressed() {
    _startVideoRecording().then((String filePath) {
      if (filePath != null) {}
    });
  }

  void _onStopButtonPressed() {
    _stopVideoRecording().then((_) {
      if (mounted) setState(() {});
    });
  }

  Future<String> _startVideoRecording() async {
    if (!controller.value.isInitialized) {
      return null;
    }

    // Do nothing if a recording is on progress
    if (controller.value.isRecordingVideo) {
      return null;
    }

    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String videoDirectory = '${appDirectory.path}/Videos';
    await Directory(videoDirectory).create(recursive: true);
    final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath = '$videoDirectory/$currentTime.mp4';
    print(filePath);

    try {
      await controller.startVideoRecording(filePath);
      videoPath = filePath;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }

    return filePath;
  }

  Future<void> _stopVideoRecording() async {
    if (!controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await controller.stopVideoRecording();
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    print(errorText);
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
