import 'dart:math';

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

  var author_list = ["Anjes782","Bokyu224",
                    "BeyondSix_3","Jhon-117",
                    "chamsaeS","Mario",
                    "SanJose2022","Halo",
                    "carrot741","PetFirst"];


  var content_list = ["Is it? I did'n know that..",
                      "Wow! so cute!",
                      ":) very nice. haha!",
                      "Me too.",
                      "So was it??",
                      "I love it!!",
                      "Who is this?",
                      "Boom! looking for this?",
                      "Lol fantastic--",
                      "Good for me. thank you",
                    ];

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: CupertinoColors.white,
        body: ListView(
          children: <Widget>[
            FakePost(tag_clicked: widget.tag_clicked,pet_post_list: widget.pet_post_list,pet_dropdown: widget.pet_dropdown,selected_dropdown: widget.selected_dropdown, locate_dropdown: widget.locate_dropdown, selected_location: widget.selected_location),

            if(widget.pet_post_list.post_auther_classes == 'vet') //쓴 사람이 vet면
              Image.asset('assets/vet_explanation.png'),
            if(widget.pet_post_list.pet_tag_info[1] == true) //tag가 Lost/Found면
              Image.asset('assets/lost_dog_banner.png'),

            Padding(padding: EdgeInsets.all(5)),
            Container(
              margin: EdgeInsets.all(7),
              color: Colors.white60,
              width: 380,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //여기 아이콘 들어가서 댓글 ㄱㄱ

                  Row(
                    children: [
                      Icon(Icons.anchor,color: Colors.primaries[Random().nextInt(Colors.primaries.length)],size: 35,),
                      SizedBox(width: 10,),
                      random_text_chat_author(),
                    ],
                  ),
                  if(widget.pet_post_list.pet_tag_info[1] == true)
                    Text("I wish you Godspeed! ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  if(widget.pet_post_list.pet_tag_info[1] != true)
                  random_text_chat_content()
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              margin: EdgeInsets.all(7),
              color: Colors.white38,
              width: 380,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.anchor,color: Colors.primaries[Random().nextInt(Colors.primaries.length)],size: 35,),
                      SizedBox(width: 10,),
                      random_text_chat_author()
                    ],
                  ),
                  if(widget.pet_post_list.pet_tag_info[1] == true)
                    Text("OMG!! I saw him at the market!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  if(widget.pet_post_list.pet_tag_info[1] != true)
                  random_text_chat_content()
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
          ],
        ),
      );
  }
  random_text_chat_author(){
    return Text(
      author_list[Random().nextInt(5)+Random().nextInt(5)+Random().nextInt(2)]
    );


  }
  random_text_chat_content(){
    return Text(
        content_list[Random().nextInt(5)+Random().nextInt(5)+Random().nextInt(2)],
        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)
    );
  }
}
