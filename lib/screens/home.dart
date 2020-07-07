import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController;

  VideoPlayerController _controller;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
    _controller = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/bettertiktok-7ae7a.appspot.com/o/1.mp4?alt=media&token=10998175-ce89-4d49-99bb-5c018de5b3d7')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        _controller.play();
        setState(() {});
      });
  }

  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Stack(
            children: [
              PageView(
                children: [
                  Container(
                    child: PageView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, i) => Container(
                        child: Center(
                          child: _controller.value.initialized
                              ? GestureDetector(
                                  child: AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: VideoPlayer(_controller),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _controller.value.isPlaying
                                          ? _controller.pause()
                                          : _controller.play();
                                    });
                                  },
                                )
                              : Container(),
                        ),
                        //  Center(
                        //   child: Text('Following ' + i.toString()),
                        // ),
                      ),
                    ),
                  ),
                  Container(
                    child: PageView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, i) => Container(
                        child: Center(
                          child: _controller.value.initialized
                              ? GestureDetector(
                                  child: AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: VideoPlayer(_controller),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _controller.value.isPlaying
                                          ? _controller.pause()
                                          : _controller.play();
                                    });
                                  },
                                )
                              : Container(),
                        ),
                        // Center(
                        //   child: Text('For you ' + i.toString()),
                        // ),
                      ),
                    ),
                  ),
                ],
                controller: _pageController,
                onPageChanged: (i) {
                  setState(() {
                    // print(i);
                    page = i;
                  });
                },
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top + 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      if (page == 0)
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
                        'For you',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      Container(
                        height: 5,
                      ),
                      if (page == 1)
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 3,
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 150,
            child: Container(
              child: Text('@user'),
            ),
          ),
          Positioned(
            bottom: 120,
            child: Container(
              child: Text('Caption'),
            ),
          ),
          Positioned(
            bottom: 70,
            child: Container(
              child: Text('Audio'),
            ),
          ),
          Positioned(
            // TODO: Add Text Counter under all icons
            bottom: 80,
            right: 5,
            child: Column(
              children: [
                SideActionIcons(
                  icon: Icons.account_circle,
                  count: '100',
                  action: () {},
                ),
                SizedBox(
                  height: 12,
                ),
                SideActionIcons(
                  icon: Icons.favorite,
                  count: '100',
                  action: () {},
                ),
                SizedBox(
                  height: 12,
                ),
                SideActionIcons(
                  icon: Icons.message,
                  count: '100',
                  action: () {},
                ),
                SizedBox(
                  height: 12,
                ),
                SideActionIcons(
                  icon: Icons.share,
                  count: '100',
                  action: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 25,
                  child: Icon(
                    Icons.music_note,
                    color: Colors.white,
                    size: 45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SideActionIcons extends StatelessWidget {
  const SideActionIcons({
    Key key,
    this.icon,
    this.count,
    this.action,
  }) : super(key: key);

  final IconData icon;
  final String count;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon),
          color: Colors.white,
          iconSize: 40,
          onPressed: action,
          padding: EdgeInsets.all(0),
        ),
        Text(count),
      ],
    );
  }
}
