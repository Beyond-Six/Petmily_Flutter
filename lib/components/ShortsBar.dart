import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/screens/ShortsScreen.dart';
import 'package:video_player/video_player.dart';

class ShortsBar extends StatefulWidget {
  const ShortsBar({Key? key}) : super(key: key);

  @override
  _ShortsBarState createState() => _ShortsBarState();
}

class _ShortsBarState extends State<ShortsBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Shorts", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500)),
          Container(
            height: 170,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index){
                  return ShortsBox(path: 'assets/video/test_video' + (index+1).toString());
                }
            )
          )

        ],
      )
    );
  }
}

class ShortsBox extends StatefulWidget {
  final String path;
  const ShortsBox({Key? key, required this.path}) : super(key: key);

  @override
  _ShortsBoxState createState() => _ShortsBoxState();
}

class _ShortsBoxState extends State<ShortsBox> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ShortsScreen(path: widget.path));
      },
      child: Container(
          width: 100,
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: new AssetImage(widget.path + '.jpg')
            )
          )
      )
    );
  }
}