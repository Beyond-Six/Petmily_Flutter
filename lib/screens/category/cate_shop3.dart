import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/components/RankBox.dart';
import 'package:new_project/components/ServiceBox.dart';
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
          Container( width: 700,height:1200,
              child: ListView(
                padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                scrollDirection: Axis.vertical,
                children: <Widget>[

                  Row(
                    children: [
                      Container(
                          child: ServiceBox()
                      ),
                      Container(
                          child: ServiceBox()
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          child: ServiceBox()
                      ),
                      Container(
                          child: ServiceBox()
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          child: ServiceBox()
                      ),
                      Container(
                          child: ServiceBox()
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