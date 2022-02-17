import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/components/RankBox.dart';
import 'package:new_project/components/ServiceBox.dart';
import 'package:new_project/screens/recommend/RecommendHome.dart';
class adopt extends StatefulWidget{
  @override
  _adoptState createState() => _adoptState();
}
class _adoptState extends State<adopt>{

  @override
  Widget build(BuildContext context) {
    const fortext = TextStyle(fontSize: 20,color: Color(0xff2C3440));
    return Container( color: Colors.white,
      child: ListView(
          children: <Widget>[
            Image.asset('assets/adopt.png',fit:BoxFit.fill ,)
          ]
      ),
    );
  }

}
