import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:new_project/screens/HomeScreen.dart';

class MyInfoDrawer extends StatefulWidget {

  const MyInfoDrawer({Key? key}) : super(key: key);

  @override
  _MyInfoDrawerState createState() => _MyInfoDrawerState();
}

class _MyInfoDrawerState extends State<MyInfoDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children : [
              DrawerHeader(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 100,
                      child: Image.asset('assets/profile.png')
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("User Name", style: TextStyle(fontSize: 30, color: Colors.white, height: 1.2),),
                        Text("Comment", style: TextStyle(fontSize: 20, color: Colors.white, height: 1.2),),
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xff2C3440)
                ),
              ),
              SelectPetComboBox(),
              PetCard(key: cardKey)

            ]
        )
    );
  }
}

class SelectPetComboBox extends StatefulWidget {
  const SelectPetComboBox({Key? key}) : super(key: key);

  @override
  _SelectPetComboBoxState createState() => _SelectPetComboBoxState();
}

class _SelectPetComboBoxState extends State<SelectPetComboBox> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffdfdf),
      alignment: Alignment.centerRight,
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("My PETMILY is ", style: TextStyle(fontSize: 25, color: Color(0xff2c3440))),
          SizedBox(width: 20),
          DropdownButton<String>(
            value: homeScreenKey.currentState?.selectedPet,
            icon: const Icon(Icons.keyboard_arrow_down),
            iconSize: 30,
            elevation: 16,
            style: const TextStyle(fontSize: 20, color: Colors.redAccent),
            underline: Container(
              height: 2,
              color: Colors.redAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                cardKey.currentState?.SetPetProfile(newValue!);
                homeScreenKey.currentState?.SetSelectedPet(newValue!);
              });
            },
            items: <String>['Joe', 'Sunny'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ]
      ),
    );
  }
}


class PetCard extends StatefulWidget {
  const PetCard({Key? key}) : super(key: key);

  @override
  _PetCardState createState() => _PetCardState();
}

GlobalKey<_PetCardState> cardKey = GlobalKey();
class _PetCardState extends State<PetCard> {

  final Map<String, String> typeMap = {'Joe':'Dog', 'Sunny':'Cat'};
  final Map<String, String> ageMap = {'Joe':'3 years', 'Sunny':'1 month'};
  final Map<String, String> breedMap = {'Joe':'Maltese', 'Sunny':'Turkish Angora'};

  late String imgPath = 'assets/image/profile_' + petName.toLowerCase() + '.png';
  late String petName = homeScreenKey.currentState!.selectedPet;
  late String? type;
  late String? age;
  late String? breed;

  @override
  void initState() {
    // TODO: implement initState
    type = typeMap[petName];
    age = ageMap[petName];
    breed = breedMap[petName];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10, offset: Offset(2, 2))]
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: new AssetImage(imgPath)
                )
              ),
            ),
            Text(homeScreenKey.currentState!.selectedPet, style: TextStyle(fontSize: 30, color: Color(0xff2c3440), fontWeight: FontWeight.w600, height: 1.2), ),
            Text("Type : ${type}", style: TextStyle(fontSize: 20, color: Color(0xff2c3440)),),
            Text("Age : ${age}", style: TextStyle(fontSize: 20, color: Color(0xff2c3440)),),
            Text("Breed : ${breed}", style: TextStyle(fontSize: 20, color: Color(0xff2c3440)),),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 5,
                    child: ClayContainer(
                        color: Color(0xFFF2F2F2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite_border, color: Colors.redAccent, size: 40),
                            Text("Book Mark", style: TextStyle(fontSize: 20, color: Color(0xff2c3440)),)
                          ],
                        )
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: ClayContainer(
                        color: Color(0xFFF2F2F2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.addchart, color: Colors.redAccent, size: 40),
                            Text("Medical Rec", style: TextStyle(fontSize: 20, color: Color(0xff2c3440)),)
                          ],
                        )
                    ),
                  )
                ],
              )
            )
          ]
        )
      ),
    );
  }




  void SetPetProfile(String setName){
    setState(() {
      petName = setName;
      imgPath = 'assets/image/profile_' + setName.toLowerCase() + '.png';
      type = typeMap[setName];
      age = ageMap[setName];
      breed = breedMap[setName];
    });
  }
}



