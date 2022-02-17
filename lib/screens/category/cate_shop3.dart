import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/components/RankBox.dart';
import 'package:new_project/components/ServiceBox.dart';
import 'package:new_project/screens/RankListScreen.dart';
import 'package:new_project/screens/category/adopt.dart';
import 'package:new_project/screens/recommend/RecommendHome.dart';
class cate_shop3 extends StatefulWidget{
  @override
  _cate_shop3State createState() => _cate_shop3State();
}
class _cate_shop3State extends State<cate_shop3>{

  @override
  Widget build(BuildContext context) {
    const fortext = TextStyle(fontSize: 20,color: Color(0xff2C3440));
    return ListView(
        children: <Widget>[
          Container( width: 700,height:1100,
              child: ListView(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 15.0, 5.0),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Column(
                        children: [
                          Text("Service",style:TextStyle(fontSize: 28, fontWeight: FontWeight.w500, height: 1.2),),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            color: Color(0xffFF5C5C),
                            width: 120,
                            height: 2,
                          ),
                        ]
                    )
                  ),

                  Row(
                    children: [
                      InkWell(
                        onTap:(){Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RankListScreen()));
                        },
                        child: Container(
                          child: ServiceBox(tabName: "GROOMING", idx: 0),

                        ),),
                      Container(
                          child: ServiceBox(tabName: "PETS HOTEL", idx: 1)
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap:(){Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => adopt()));
                        },
                      child: Container(
                          child: ServiceBox(tabName: "ADOPTION", idx: 5),

                      ),),
                      Container(
                          child: ServiceBox(tabName: "VETERINARY CARE", idx: 4)
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          child: ServiceBox(tabName: "DOGGIE DAY CAMP", idx: 2),

                      ),
                      Container(
                          child: ServiceBox(tabName: "DOG TRAINING", idx: 3)
                      ),
                    ],
                  ),

                ],
              )
          )
        ]
    );
  }

}
