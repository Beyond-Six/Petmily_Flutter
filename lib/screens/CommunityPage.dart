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
  String post_auther_classes = "";
  String post_date = "";
  String post_data_string = "";
  String post_location = "";
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

  final _dropdown_items_pet = ['Pet','Dogs','Cats','Birds','Repts','Another'];
  var _selected_pet = 'Pet';

  final _dropdown_items_locate = ['Location','San Jose','Oakland','Santa Clara','Milpitas','Monterey'];
  var _selected_locate = 'Location';


  var tags = ["Vets","Shorts","Train","Walk","Food","Help"];
  List<bool> tagButtonSelected = [false,false,false,false,false,false];

  //int i=0;

  @override
  Widget build(BuildContext context) {
    Set_Fake_Post_info();
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xffFFEDE2),
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

                    print(value.toString());
                    _selected_pet = value as String;
                    print(_selected_pet.toString());
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
            Column(
              children: [
                SizedBox(height: 7,),
                Container(
                    height: 40,   //tag 의 스트링이 자꾸 높이의 중간에 안맞는다.
                    decoration: BoxDecoration(
                      color: Colors.white30,
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
              ],
            ),

            Center(
              child: Column(
                children: [

                  Container(
                    child: Column(
                      children: <Widget>[

                        FakePost(pet_post_list : Dog_Post_Fake_Info,tag_clicked : tagButtonSelected,pet_dropdown : _dropdown_items_pet,selected_dropdown : _selected_pet,locate_dropdown : _dropdown_items_locate,selected_location : _selected_locate),
                        if(tagButtonSelected[1] == true)
                          Container(
                          width: 400,
                          child: ShortsScreen(path: 'assets/video/test_video1.mp4',),
                          ),
                        ShortsBox(path: 'assets/video/test_video1.',),
                        FakePost(pet_post_list : Cat_Post_Fake_Info,tag_clicked : tagButtonSelected,pet_dropdown : _dropdown_items_pet,selected_dropdown : _selected_pet,locate_dropdown : _dropdown_items_locate,selected_location : _selected_locate),
                        FakePost(pet_post_list : Bird_Post_Fake_Info,tag_clicked : tagButtonSelected,pet_dropdown : _dropdown_items_pet,selected_dropdown : _selected_pet,locate_dropdown : _dropdown_items_locate,selected_location : _selected_locate),
                        FakePost(pet_post_list : Rept_Post_Fake_Info,tag_clicked : tagButtonSelected,pet_dropdown : _dropdown_items_pet,selected_dropdown : _selected_pet,locate_dropdown : _dropdown_items_locate,selected_location : _selected_locate),
                      ],
                    ),
                  ),
                ],
              ),
            ),


          ]


      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xffFFEDE2),
        onPressed: (){
          Navigator.push(context, CupertinoPageRoute(builder: (context) => EditPage()));
          //Dogs.pet_name = "dd";
          //print(Dogs.pet_name);
        },
        tooltip: 'add_post',

        label: Text('Post',style: TextStyle(color: Color(0xff2C3440),fontSize: 20),),
        icon: const Icon(Icons.add,color: Color(0xff2C3440),),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  tag_bar(tag_button) => Container(
    margin: EdgeInsets.all(2),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
        tagButtonSelected[tag_button] ?
        Color(0xffFF5C5C) : Colors.white30
    ),
          child: TextButton(
            
              child:
              Text(tagButtonSelected[tag_button] ? tags[tag_button] : tags[tag_button],style : TextStyle(fontSize: 20,color: Colors.black, height: 1.2),),
              onPressed: () {
                setState(() {
                  tagButtonSelected[tag_button] ? tagButtonSelected[tag_button] = false : tagButtonSelected[tag_button] = true;
                });
              }
    ),
  );

  void Set_Fake_Post_info(){
    Dog_Post_Fake_Info.pet_name="Dogs";
    Dog_Post_Fake_Info.pet_file_name="assets/dogPicture2.jpg";
    Dog_Post_Fake_Info.post_date="13 : 10";
    Dog_Post_Fake_Info.post_auther="dog4541";
    Dog_Post_Fake_Info.post_auther_classes="";
    Dog_Post_Fake_Info.post_data_string = "My dog like this food.\nI think it's delicious for him..";
    Dog_Post_Fake_Info.post_location = _dropdown_items_locate[1];
    Dog_Post_Fake_Info.pet_tag_info = [false, false, false, false, true, false];

    Cat_Post_Fake_Info.pet_name="Cats";
    Cat_Post_Fake_Info.pet_file_name="assets/cat.png";
    Cat_Post_Fake_Info.post_date="13 : 11";
    Cat_Post_Fake_Info.post_auther="cat1234";
    Cat_Post_Fake_Info.post_auther_classes="vet";
    Cat_Post_Fake_Info.post_data_string = "Hello, I am veterinarian 'Kim'. How much do you know about cats? Are cats really a creature we don't understand?";
    Cat_Post_Fake_Info.post_location = _dropdown_items_locate[4];
    Cat_Post_Fake_Info.pet_tag_info = [true, false, false, false, false, false];

    Bird_Post_Fake_Info.pet_name="Birds";
    Bird_Post_Fake_Info.pet_file_name="assets/bird.png";
    Bird_Post_Fake_Info.post_date="13 : 12";
    Bird_Post_Fake_Info.post_auther="bird0001";
    Bird_Post_Fake_Info.post_auther_classes="";
    Bird_Post_Fake_Info.post_data_string = "I am Bird. Do you Love me?";
    Bird_Post_Fake_Info.post_location = _dropdown_items_locate[2];
    Bird_Post_Fake_Info.pet_tag_info = [false, false, false, true, false,false];

    Rept_Post_Fake_Info.pet_name="Repts";
    Rept_Post_Fake_Info.pet_file_name="assets/rept.png";
    Rept_Post_Fake_Info.post_date="13 : 13";
    Rept_Post_Fake_Info.post_auther="rept984";
    Rept_Post_Fake_Info.post_auther_classes="";
    Rept_Post_Fake_Info.post_data_string = "I'm hungry";
    Rept_Post_Fake_Info.post_location = _dropdown_items_locate[1];
    Rept_Post_Fake_Info.pet_tag_info = [false, false, true, false, false, false];
  }
}

