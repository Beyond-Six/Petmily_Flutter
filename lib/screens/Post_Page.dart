import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/components/FakePost.dart';

import 'CommunityPage.dart';

class Post_Page extends StatefulWidget {
  const Post_Page({Key? key,required this.pet_post_list,required this.tag_clicked,required this.dropdown,required this.selected_dropdown}) : super(key: key);

  final Pet_Post_List pet_post_list;
  final List<bool> tag_clicked;
  final List<String> dropdown;
  final String selected_dropdown;

  @override
  _Post_PageState createState() => _Post_PageState(pet_post_list);
}

class _Post_PageState extends State<Post_Page> {
  _Post_PageState(Pet_Post_List pet_post_list);


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: CupertinoColors.white,
        body: Column(
          children: <Widget>[
            FakePost(tag_clicked: widget.tag_clicked,pet_post_list: widget.pet_post_list,dropdown: widget.dropdown,selected_dropdown: widget.selected_dropdown),

            Padding(padding: EdgeInsets.all(10)),
            Container(
              color: Colors.white60,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Beyond_Six_3"),
                  Text("hi!!!! hello!!!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              color: Colors.white38,
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("san_jose"),
                  Text("He is so cute!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ],
              ),
            ),

          ],
        ),
      );
  }
}
