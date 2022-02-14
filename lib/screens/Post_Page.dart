import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/components/FakePost.dart';

import 'CommunityPage.dart';

class Post_Page extends StatefulWidget {
  const Post_Page({Key? key,required this.pet_post_list,required this.tag_clicked}) : super(key: key);
  
  final Pet_Post_List pet_post_list;
  final List<bool> tag_clicked;
  
  @override
  _Post_PageState createState() => _Post_PageState(pet_post_list);
}

class _Post_PageState extends State<Post_Page> {
  _Post_PageState(Pet_Post_List pet_post_list);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CupertinoColors.white,

        body: Column(
          children: <Widget>[
            FakePost(tag_clicked: widget.tag_clicked,pet_post_list: widget.pet_post_list),

            Padding(padding: EdgeInsets.all(20)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("cat1234"),
                  Text("hi!!!! hello!!!"),
                ],
              ),
            ),

            const TextField(
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              //obscureText: true,
              decoration: InputDecoration(
                //border: OutlineInputBorder(),
                labelText: 'Text',
              ),
            ),
          ],
        ),
      );
  }
}
