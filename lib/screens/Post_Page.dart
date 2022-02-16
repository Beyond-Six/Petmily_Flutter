import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/components/FakePost.dart';

import 'CommunityPage.dart';

class Post_Page extends StatefulWidget {
  const Post_Page({Key? key,required this.pet_post_list,required this.tag_clicked,required this.pet_dropdown,required this.selected_dropdown,required this.locate_dropdown,required this.selected_location}) : super(key: key);

  final Pet_Post_List pet_post_list;
  final List<bool> tag_clicked;
  final List<String> pet_dropdown;
  final String selected_dropdown;
  final List<String> locate_dropdown;
  final String selected_location;
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
            FakePost(tag_clicked: widget.tag_clicked,pet_post_list: widget.pet_post_list,pet_dropdown: widget.pet_dropdown,selected_dropdown: widget.selected_dropdown, locate_dropdown: widget.locate_dropdown, selected_location: widget.selected_location),

            Padding(padding: EdgeInsets.all(10)),
            Container(
              color: Colors.white60,
              width: 380,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //여기 아이콘 들어가서 댓글 ㄱㄱ

                  Row(
                    children: [
                      Icon(Icons.anchor,color: Colors.orange,),
                      SizedBox(width: 10,),
                      Text("Beyond_Six_3"),
                    ],
                  ),
                  Text("Hi!!!! nice to see you!!!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              color: Colors.white38,
              width: 380,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.anchor,color: Colors.amberAccent,),
                      SizedBox(width: 10,),
                      Text("san45_jose"),
                    ],
                  ),
                  Text("They are so cute!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                ],
              ),
            ),

          ],
        ),
      );
  }
}
