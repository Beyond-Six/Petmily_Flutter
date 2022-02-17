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
Pet_Post_List Lost_Post_Fake_Info = new Pet_Post_List();



class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {

  final _dropdown_items_pet = ['Pet','Dogs','Cats','Birds','Repts','Fish'];
  var _selected_pet = 'Pet';

  final _dropdown_items_locate = ['Location','San Jose','Oakland','Santa Clara','Milpitas','Monterey'];
  var _selected_locate = 'Location';


  var tags = ["Vets","Lost/found","Shorts","Train","Walk","Food"];
  List<bool> tagButtonSelected = [false,false,false,false,false,false];

  //int i=0;

  @override
  Widget build(BuildContext context) {
    Set_Fake_Post_info();
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xffFFEDE2),
        actions: <Widget>[
          Column(
            children: [
              Row(
                children: [

                   DropdownButton(
                      style: TextStyle(fontSize: 15,color: Color(0xff2C3440),),
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
                    ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: DropdownButton(
                      style: TextStyle(fontSize: 15,color: Color(0xff2C3440)),
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
                    ),
                  ),

                  Padding( padding:EdgeInsets.only(right: 10))
                ],
              ),
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
                    height: 40,   
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
                          if((tagButtonSelected[2] == true) || ((tagButtonSelected[0] == false)&&(tagButtonSelected[1] == false)&&(tagButtonSelected[2] == false)&&(tagButtonSelected[3] == false)&&(tagButtonSelected[4] == false)&&(tagButtonSelected[5] == false)))
                            ShortsBar(),
                          if((tagButtonSelected[2] == true) || ((tagButtonSelected[0] == false)&&(tagButtonSelected[1] == false)&&(tagButtonSelected[2] == false)&&(tagButtonSelected[3] == false)&&(tagButtonSelected[4] == false)&&(tagButtonSelected[5] == false)))
                            Container(
                                width: 410,
                                child: Divider(color: Colors.grey, thickness: 0.8)),
                          FakePost(pet_post_list : Cat_Post_Fake_Info,tag_clicked : tagButtonSelected,pet_dropdown : _dropdown_items_pet,selected_dropdown : _selected_pet,locate_dropdown : _dropdown_items_locate,selected_location : _selected_locate),
                          FakePost(pet_post_list : Bird_Post_Fake_Info,tag_clicked : tagButtonSelected,pet_dropdown : _dropdown_items_pet,selected_dropdown : _selected_pet,locate_dropdown : _dropdown_items_locate,selected_location : _selected_locate),
                          FakePost(pet_post_list : Rept_Post_Fake_Info,tag_clicked : tagButtonSelected,pet_dropdown : _dropdown_items_pet,selected_dropdown : _selected_pet,locate_dropdown : _dropdown_items_locate,selected_location : _selected_locate),
                          FakePost(pet_post_list : Lost_Post_Fake_Info,tag_clicked : tagButtonSelected,pet_dropdown : _dropdown_items_pet,selected_dropdown : _selected_pet,locate_dropdown : _dropdown_items_locate,selected_location : _selected_locate),
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
    Dog_Post_Fake_Info.pet_file_name="assets/dog_food.png";
    Dog_Post_Fake_Info.post_date="13 : 15";
    Dog_Post_Fake_Info.post_auther="Mydog41";
    Dog_Post_Fake_Info.post_auther_classes="";
    Dog_Post_Fake_Info.post_data_string = "My dog really likes this snack.  The name of the snack is Lembas.";
    Dog_Post_Fake_Info.post_location = _dropdown_items_locate[1];
    Dog_Post_Fake_Info.pet_tag_info = [false, false, false, false, false, true];

    Cat_Post_Fake_Info.pet_name="Cats";
    Cat_Post_Fake_Info.pet_file_name="assets/cat.png";
    Cat_Post_Fake_Info.post_date="13 : 10";
    Cat_Post_Fake_Info.post_auther="vet. John";
    Cat_Post_Fake_Info.post_auther_classes="vet";
    Cat_Post_Fake_Info.post_data_string = "Hello, I am veterinarian John.  "
        "How much do you know about cats? "
        "  Are cats really a creature we can't understand?";
    Cat_Post_Fake_Info.post_location = _dropdown_items_locate[4];
    Cat_Post_Fake_Info.pet_tag_info = [true, false, false, false, false, false];

    Bird_Post_Fake_Info.pet_name="Birds";
    Bird_Post_Fake_Info.pet_file_name="assets/bird.png";
    Bird_Post_Fake_Info.post_date="12 : 12";
    Bird_Post_Fake_Info.post_auther="yourBest78";
    Bird_Post_Fake_Info.post_auther_classes="";
    Bird_Post_Fake_Info.post_data_string = "I am Bird.  Do you Love me?";
    Bird_Post_Fake_Info.post_location = _dropdown_items_locate[2];
    Bird_Post_Fake_Info.pet_tag_info = [false, false, false, false, true,false];

    Rept_Post_Fake_Info.pet_name="Repts";
    Rept_Post_Fake_Info.pet_file_name="assets/rept.png";
    Rept_Post_Fake_Info.post_date="12 : 10";
    Rept_Post_Fake_Info.post_auther="rept984";
    Rept_Post_Fake_Info.post_auther_classes="";
    Rept_Post_Fake_Info.post_data_string = "He can swim.  I taught him how to swim yesterday.";
    Rept_Post_Fake_Info.post_location = _dropdown_items_locate[1];
    Rept_Post_Fake_Info.pet_tag_info = [false, false, false, true, false, false];

    Lost_Post_Fake_Info.pet_name="Dogs";
    Lost_Post_Fake_Info.pet_file_name="assets/dog_food.png";
    Lost_Post_Fake_Info.post_date="12 : 21";
    Lost_Post_Fake_Info.post_auther="mydoggy~~";
    Lost_Post_Fake_Info.post_auther_classes="";
    Lost_Post_Fake_Info.post_data_string = "I lost him.  He's name is ben parker."
        "  Can you call me if you find him?? Oh god.";
    Lost_Post_Fake_Info.post_location = _dropdown_items_locate[1];
    Lost_Post_Fake_Info.pet_tag_info = [false, true, false, false, false, false];
  }
}