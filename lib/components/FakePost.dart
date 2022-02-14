import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_project/screens/CommunityPage.dart';
import 'package:new_project/screens/Post_Page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';



class FakePost extends StatefulWidget {
  const FakePost({Key? key, required this.pet_post_list,required this.tag_clicked}) : super(key: key);

  final Pet_Post_List pet_post_list;
  final List<bool> tag_clicked;
  @override
  _FakePostState createState() => _FakePostState(pet_post_list);

}

class _FakePostState extends State<FakePost> {

  bool favButtonSelected = false;
  var tags = ["PetAdotp","Vets","Train","Walk","Food","Help"];
  List<bool> tagButtonSelected = [false, false, false, false, false, false];

  _FakePostState(Pet_Post_List pet_post_list);
  


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        pushNewScreen(
            context,
            screen: Post_Page(tag_clicked: widget.tag_clicked,pet_post_list: widget.pet_post_list),
            withNavBar: true,
            pageTransitionAnimation: PageTransitionAnimation.fade
        );
      },
      child: Column(
        children: <Widget>[
          //Set_Fake_Post_info(),
          Padding(padding: EdgeInsets.only(top: 5)),
          MakeFakePost(widget.tag_clicked,widget.pet_post_list),
          Container(
              width: 410,
              child: Divider(color: Colors.grey, thickness: 0.8)
          ),
        ],
      ),
    );
  }

  tag_bar(index_info,Pet_Post_List pet_post_fake_info) =>
      Container(

        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),
            color:
            widget.tag_clicked[index_info] ?
            CupertinoColors.systemPink : CupertinoColors.lightBackgroundGray
        ),
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 5)),
            TextButton(

                child: Text(tags[index_info],
                  style: TextStyle(fontSize: 20, color: Colors.black),),
                onPressed: () {
                  setState(() {
                    //pet_post_fake_info.pet_tag_info_clicked[index_info]
                      //  ? pet_post_fake_info.pet_tag_info_clicked[index_info] = false
                        //: pet_post_fake_info.pet_tag_info_clicked[index_info] = true;
                  });
                }
            ),
          ],
        ),
      );


  MakeFakePost(List<bool> tag_clicked,Pet_Post_List pet_post_fake_info) =>

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(

            child: Column(

              children: [
                Container(

                  width: 390,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CupertinoColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: <Widget>[
                        Row(children: [
                          for(int i=0;i<pet_post_fake_info.pet_tag_info.length;i++)
                            if(pet_post_fake_info.pet_tag_info[i])
                              tag_bar(i, pet_post_fake_info),   //게시글의 상단에 태그 출력
                        ],),

                        Text(pet_post_fake_info.post_date, style: TextStyle(fontSize: 20),),
                      //오른쪽에 배치
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  width: 390,
                  height: 280,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CupertinoColors.white,
                    image: DecorationImage(
                      image: AssetImage(pet_post_fake_info.pet_file_name),
                      fit: BoxFit.fitWidth
                      ),
                    )
                  ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Container(
                  width: 390,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CupertinoColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        children: [
                          Icon(Icons.anchor),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(pet_post_fake_info.post_auther, style: TextStyle(fontSize: 20),),
                        ],
                      ),

                      Row(
                        children: [
                          IconButton(
                            padding: EdgeInsets.all(0.0),
                            icon: Icon(
                                favButtonSelected ? Icons.favorite : Icons
                                    .favorite_border),
                            color: Colors.black,
                            onPressed: () {
                              setState(() {
                                favButtonSelected
                                    ? favButtonSelected = false
                                    : favButtonSelected = true;
                              });
                            },
                          ),
                          IconButton(
                            padding: EdgeInsets.all(0.0),
                            icon: Icon(Icons.add_comment),
                            color: Colors.black,
                            onPressed: () {
                              setState(() {

                              });
                            },
                          ),
                        ],
                      ),
                      //IconButton(onPressed: (){}, icon: const Icon(Icons.add_comment) ),

                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      );

}