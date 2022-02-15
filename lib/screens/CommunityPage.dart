import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/components/FakePost.dart';
import 'package:new_project/components/ShortsBar.dart';

import 'EditPostPage.dart';
import 'ShortsScreen.dart';

class Pet_Post_List{
  String pet_name = "";
  String pet_file_name = "";
  String post_auther = "";
  String post_date = "";
  String post_data_string = "";
  List<bool> pet_tag_info = [false,false,false,false,false,false];
  List<bool> pet_tag_info_clicked = [false,false,false,false,false,false];
}

Pet_Post_List Dog_Post_Fake_Info = new Pet_Post_List();
Pet_Post_List Cat_Post_Fake_Info = new Pet_Post_List();
Pet_Post_List Bird_Post_Fake_Info = new Pet_Post_List();
Pet_Post_List Rept_Post_Fake_Info = new Pet_Post_List();



class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {

  final _dropdown_items_pet = ['All','Dogs','Cats','Birds','Rapts',"Another"];
  var _selected_pet = 'All';

  final _dropdown_items_locate = ['San Jose','Santa Clara','Milpitas'];
  var _selected_locate = 'San Jose';


  var tags = ["Hello","Vets","Train","Walk","Food","Help"];
  List<bool> tagButtonSelected = [false,false,false,false,false,false];

  //int i=0;

  @override
  Widget build(BuildContext context) {
    Set_Fake_Post_info();
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xffFABBBB),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(child: DropdownButton(
                value: _selected_locate,
                items: _dropdown_items_locate.map(
                        (value) {
                      return DropdownMenuItem(
                          value: value,
                          child: Text(value)
                      );
                    }
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    _selected_locate = value as String;
                  });
                },
              )),
              Container(child: DropdownButton(
                value: _selected_pet,
                items: _dropdown_items_pet.map(
                        (value) {
                      return DropdownMenuItem(
                          value: value,
                          child: Text(value)
                      );
                    }
                ).toList(),
                onChanged: (value) {
                  setState(() {
                    _selected_pet = value as String;
                  });
                },
              )),

              Padding( padding:EdgeInsets.only(right: 10))
            ],
          )
        ],
      ),

      body: ListView(
          physics: BouncingScrollPhysics(),

          children: <Widget>[
            Container(
                height: 35,   //tag 의 스트링이 자꾸 높이의 중간에 안맞는다.
                decoration: BoxDecoration(
                  color: CupertinoColors.lightBackgroundGray,
                ),
                child:
                ListView(

                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for(int i=0; i<tags.length ;i++)(
                        tag_bar(i)
                    )

                  ],
                )

            ),
            Center(
              child: Column(
                children: [

                  Container(
                    child: Column(
                      children: <Widget>[

                        FakePost(pet_post_list : Dog_Post_Fake_Info,tag_clicked : tagButtonSelected,dropdown : _dropdown_items_pet,selected_dropdown : _selected_pet),
                        //Container(
                        //width: 390,
                        //child: ShortsScreen(path: 'assets/video/test_video1.mp4',),
                        //),
                        //ShortsBox(path: 'assets/video/test_video1.',),
                        FakePost(pet_post_list : Cat_Post_Fake_Info,tag_clicked : tagButtonSelected,dropdown : _dropdown_items_pet,selected_dropdown : _selected_pet),
                        FakePost(pet_post_list : Bird_Post_Fake_Info,tag_clicked : tagButtonSelected,dropdown : _dropdown_items_pet,selected_dropdown : _selected_pet),
                        FakePost(pet_post_list : Rept_Post_Fake_Info,tag_clicked : tagButtonSelected,dropdown : _dropdown_items_pet,selected_dropdown : _selected_pet),
                      ],
                    ),
                  ),
                ],
              ),
            ),


          ]


      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xffFABBBB),
        onPressed: (){
          Navigator.push(context, CupertinoPageRoute(builder: (context) => EditPage()));
          //Dogs.pet_name = "dd";
          //print(Dogs.pet_name);
        },
        tooltip: '추가',

        label: Text('글쓰기'),
        icon: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  tag_bar(tag_button) => Container(

    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
        tagButtonSelected[tag_button] ?
        CupertinoColors.systemPink : CupertinoColors.lightBackgroundGray
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Spacer(flex: 1),
        Container(
          width: 5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        TextButton(
            child:
            Text(tagButtonSelected[tag_button] ? tags[tag_button] : tags[tag_button],style : TextStyle(fontSize: 20,color: Colors.black, height: 1.2),),
            onPressed: () {
              setState(() {
                tagButtonSelected[tag_button] ? tagButtonSelected[tag_button] = false : tagButtonSelected[tag_button] = true;
              });

            }
        ),
      ],
    ),
  );

  void Set_Fake_Post_info(){
    Dog_Post_Fake_Info.pet_name="dog";
    Dog_Post_Fake_Info.pet_file_name="assets/image/mainBanner/weeklyFeatured0.jpg";
    Dog_Post_Fake_Info.post_date="13 : 10";
    Dog_Post_Fake_Info.post_auther="dog4541";
    Dog_Post_Fake_Info.post_data_string = "My dog like this food.\nI think it's delicious for him..";
    Dog_Post_Fake_Info.pet_tag_info = [false, false, false, false, true, false];

    Cat_Post_Fake_Info.pet_name="cat";
    Cat_Post_Fake_Info.pet_file_name="assets/cat.png";
    Cat_Post_Fake_Info.post_date="13 : 11";
    Cat_Post_Fake_Info.post_auther="cat1234";
    Cat_Post_Fake_Info.post_data_string = "do you know about cat?";
    Cat_Post_Fake_Info.pet_tag_info = [true, false, false, false, false, false];

    Bird_Post_Fake_Info.pet_name="bird";
    Bird_Post_Fake_Info.pet_file_name="assets/bird.png";
    Bird_Post_Fake_Info.post_date="13 : 12";
    Bird_Post_Fake_Info.post_auther="bird0001";
    Bird_Post_Fake_Info.post_data_string = "I am Bird. Do you Love me?";
    Bird_Post_Fake_Info.pet_tag_info = [false, true, false, false, false,false];

    Rept_Post_Fake_Info.pet_name="rept";
    Rept_Post_Fake_Info.pet_file_name="assets/rept.png";
    Rept_Post_Fake_Info.post_date="13 : 13";
    Rept_Post_Fake_Info.post_auther="rept984";
    Rept_Post_Fake_Info.post_data_string = "I'm hungry";
    Rept_Post_Fake_Info.pet_tag_info = [false, false, true, false, false, false];
  }
}

