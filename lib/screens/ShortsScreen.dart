import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../MainPage.dart';

class ShortsScreen extends StatefulWidget {
  final String path;
  const ShortsScreen({Key? key, required this.path}) : super(key: key);

  @override
  _ShortsScreenState createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  late VideoPlayerController controller;
  bool isLike = false;

  @override
  void initState() {
    // TODO: implement initState
    controller = VideoPlayerController.asset(widget.path + '.mp4');
    controller.initialize().then((_) => controller.play());
    controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: SafeArea(
        child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller)
                ),
              ),
              Material(
                type: MaterialType.transparency,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              Material(
                type: MaterialType.transparency,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shorts Name', style: TextStyle(fontSize: 40, color: Colors.white, height: 0.7)),
                      Text('User Name', style: TextStyle(fontSize: 20, color: Colors.white, height: 1)),
                      Text('View Count / like Count', style: TextStyle(fontSize: 18, color: Colors.white, height: 1))
                    ]
                  ),
                )
              ),
              Material(
                type: MaterialType.transparency,
                child: Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.chat_bubble_outline, color: Colors.white, size: 30),
                        onPressed: () {
                        },
                      ),
                      IconButton(
                        icon: Icon(isLike ? Icons.favorite : Icons.favorite_border, color: Colors.redAccent, size: 30),
                        onPressed: () {
                          setState(() {
                            isLike ? isLike = false : isLike = true;
                          });
                        },
                      )
                    ] ,
                  ),
                ),
              ),
            ]
        )
      )
    );
  }
}
