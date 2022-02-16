import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/components/BrandBar.dart';
import 'package:new_project/components/CategoryBar.dart';
import 'package:new_project/components/RankBox.dart';
import 'package:new_project/components/RankSlideBar.dart';
import 'package:new_project/components/RankTab.dart';
import 'package:new_project/components/ShortsBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// ignore_for_file: prefer_const_constructors

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

GlobalKey<_HomeScreenState> homeScreenKey = GlobalKey();
class _HomeScreenState extends State<HomeScreen> {
  late String selectedPet = "Joe";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("My PETMILY is ", style: TextStyle(fontSize: 40.0, color:Theme.of(context).primaryColor, fontWeight: FontWeight.w500),),
                      Text(selectedPet, style: TextStyle(fontSize: 40.0, color: Colors.redAccent, fontWeight: FontWeight.w500, decoration: TextDecoration.underline))
                    ]
                  )
              ),
              Divider(color: Colors.grey, thickness: 0.2, height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("Weekly Featured", style: TextStyle(fontSize: 22.0)),
                    Text("Show More", style: TextStyle(fontSize: 12.0, color: Colors.black38))
                  ]
                ),
              ),
              Container(
                height: 250,
                child: RankSlideBar()
              ),
              Container(
                  width: 350,
                  child: Divider(color: Colors.grey, thickness: 0.2)),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget> [
                            Text(selectedPet + " Will Love It", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500)),

                          ],
                        )
                      ),
                      Text("Show More", style: TextStyle(fontSize: 12.0, color: Colors.black38))
                    ]
                ),
              ),
              Container(
                height: 210,
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: RankTab()
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                child: ShortsBar()
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                  child: BrandBar()
              ),
              SizedBox(
                height: 20,
              )
            ]
          )
        ],
      )
    );
  }

  void SetSelectedPet(String newValue){
    setState(() {
        selectedPet = newValue;
    });
  }
}
