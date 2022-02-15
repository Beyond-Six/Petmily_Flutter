import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/LandingPage.dart';
import 'package:numberpicker/numberpicker.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  int _currentAnimalValue = 0;
  int _currentBreedValue = 0;
  int _currentAgeValue = 0;
  int _currentSkinValue = 0;
  int _currentWeightValue = 0;


  String typeList(String idx){
    List<String> type = ['Dog', 'Cat', 'Bird', 'Reptile', 'Rodent'];
    return type[int.parse(idx)];
  }

  String breedList(String idx){
    List<String> type = ['Akita', 'Boxer', 'Chigi', 'Chion', 'Poodle', 'Pug', 'Shiba', 'Horgi', 'Terrier'];
    return type[int.parse(idx)];
  }

  String skinList(String idx){
    List<String> type = ['Dry', 'Oily'];
    return type[int.parse(idx)];
  }

  String weightList(String idx){
    List<String> type = ['~1kg', '~5kg', '~10kg', '~20kg'];
    return type[int.parse(idx)];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                SizedBox(height: 16),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('ANIMAL', style: TextStyle(color: Color(0xff2c3440), fontSize:30, fontWeight: FontWeight.w600))
                ),
                NumberPicker(
                  value: _currentAnimalValue,
                  minValue: 0,
                  maxValue: 4,
                  textMapper: typeList,
                  step: 1,
                  axis: Axis.horizontal,
                  selectedTextStyle: TextStyle(color: Colors.redAccent, fontSize: 30, fontWeight: FontWeight.w500),
                  textStyle: TextStyle(color: Colors.black45),
                  onChanged: (value) => setState(() => _currentAnimalValue = value),
                ),

                SizedBox(height: 10),

                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('BREED', style: TextStyle(color: Color(0xff2c3440), fontSize:30, fontWeight: FontWeight.w600))
                ),
                NumberPicker(
                  value: _currentBreedValue,
                  minValue: 0,
                  maxValue: 8,
                  step: 1,
                  textMapper: breedList,
                  axis: Axis.horizontal,
                  selectedTextStyle: TextStyle(color: Colors.redAccent, fontSize: 30, fontWeight: FontWeight.w500, height: 1),
                  textStyle: TextStyle(color: Colors.black45),
                  onChanged: (value) =>
                      setState(() => _currentBreedValue = value),
                ),

                SizedBox(height: 10),

                Container(
                    alignment: Alignment.centerLeft,
                    child: Text('AGE', style: TextStyle(color: Color(0xff2c3440), fontSize:30, fontWeight: FontWeight.w600))
                ),
                NumberPicker(
                  value: _currentAgeValue,
                  minValue: 0,
                  maxValue: 20,
                  step: 1,
                  axis: Axis.horizontal,
                  selectedTextStyle: TextStyle(color: Colors.redAccent, fontSize: 30, fontWeight: FontWeight.w500),
                  textStyle: TextStyle(color: Colors.black45),
                  onChanged: (value) =>
                      setState(() => _currentAgeValue = value),
                ),

                SizedBox(height: 10),

                Container(
                    alignment: Alignment.centerLeft,
                    child: Text('SKIN', style: TextStyle(color: Color(0xff2c3440), fontSize:30, fontWeight: FontWeight.w600))
                ),
                NumberPicker(
                  value: _currentSkinValue,
                  minValue: 0,
                  maxValue: 1,
                  step: 1,
                  axis: Axis.horizontal,
                  textMapper: skinList,
                  selectedTextStyle: TextStyle(color: Colors.redAccent, fontSize: 30, fontWeight: FontWeight.w500),
                  textStyle: TextStyle(color: Colors.black45),
                  onChanged: (value) =>
                      setState(() => _currentSkinValue = value),
                ),

                SizedBox(height: 10),

                Container(
                    alignment: Alignment.centerLeft,
                    child: Text('WEIGHT', style: TextStyle(color: Color(0xff2c3440), fontSize:30, fontWeight: FontWeight.w600))
                ),
                NumberPicker(
                  value: _currentWeightValue,
                  minValue: 0,
                  maxValue: 3,
                  step: 1,
                  axis: Axis.horizontal,
                  textMapper: weightList,
                  selectedTextStyle: TextStyle(color: Colors.redAccent, fontSize: 30, fontWeight: FontWeight.w500),
                  textStyle: TextStyle(color: Colors.black45),
                  onChanged: (value) =>
                      setState(() => _currentWeightValue = value),
                ),

                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        child: Text('Later', style: TextStyle(color: Colors.redAccent, fontSize: 30, fontWeight: FontWeight.w500)),
                        onTap: () {
                          Get.off(() => LandingPage());
                        }
                    ),
                    SizedBox(width: 40),
                    InkWell(
                      child: Text('Done', style: TextStyle(color: Colors.redAccent, fontSize: 30, fontWeight: FontWeight.w500)),
                      onTap: () {
                        Get.off(() => LandingPage());
                      }
                    )


                  ],
                )
              ],
            ),

          ])


        )

    );
  }
}
