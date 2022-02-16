import 'package:flutter/material.dart';
import 'package:new_project/components/RankTab.dart';

class RecommendHome2 extends StatefulWidget{
  @override
  _RecommendHome2State createState() => _RecommendHome2State();
}
class _RecommendHome2State extends State<RecommendHome2>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( //추천 서비스 큰 박스
        children: <Widget>[
          Container( //그위에 텍스트
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text:"Today's Treat for ",style: TextStyle(fontSize: 30,)),
                  TextSpan(text:"Joe",style: TextStyle(fontSize: 30,decoration:TextDecoration.underline,color: Color(0xffFF5C5C)))
                ]
              )
            ),
            margin: EdgeInsets.all(1),
          ),
          Center( //그아래 큰 박스
            child: Container(
            width: 350, height: 348,
            decoration: BoxDecoration(borderRadius:BorderRadius.circular(7),color: Color(0xffFFEDE2)),
            padding: EdgeInsets.all(10),margin: EdgeInsets.only(bottom:2),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                        children: <Widget>[Expanded(child: Container(
                          height:200,child:Image.asset('assets/treat_1.png',fit:BoxFit.fitWidth)
                        ),
                            flex:1
                        ),
                          Expanded(child: Container(
                              height:189,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
                                  Container(
                                      child: Text("Milk-Bone",
                                          style: TextStyle(fontSize: 15,color: Colors.black26,)),
                                    height:18,
                                  ),
                                ],),
                                Column(children: <Widget>[
                                  Container(
                                    child: Text("Brushing Chews Dental",
                                        style: TextStyle(fontSize: 23,color: Colors.black,)),
                                    height:29,
                                  ),
                                ],),
                                Column(children: <Widget>[
                                  Container(
                                      height:20,child: stars,
                                  ),
                                ],),
                                Column(children: <Widget>[
                                  Container(
                                    child:Text("4.5 (140)",style: TextStyle(fontSize:17,color:Colors.black54,)),
                                    height:20,
                                  ),
                                ],),
                                Column(children: <Widget>[
                                  Container(
                                    child: Text("29.9oz / \$8.48",
                                        style: TextStyle(fontSize: 17)),
                                    height:22,
                                  ),
                                ],),
                                Column(
                                  children: <Widget>[
                                  Container(
                                      height:80,
                                    child: Column(
                                      children: <Widget>[
                                      Container(
                                        height: 35,
                                        child: Row(children: <Widget>[
                                          Container(
                                              width:80,height:29,padding: EdgeInsets.only(bottom: 6,top:0),
                                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(30),color: Color(0xffFF5C5C)),
                                              child: Text("Natural",textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white,fontSize: 18),),
                                          ),
                                          Container(
                                            width:6,
                                          ),
                                          Container(
                                            width:80,height:29,padding: EdgeInsets.only(bottom: 6,top:0),
                                            decoration: BoxDecoration(borderRadius:BorderRadius.circular(30),color: Color(0xffFF5C5C)),
                                            child: Text("2~7 kgs",textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white,fontSize: 18),),
                                          ),
                                        ],

                                        )
                                      ),
                                      Container(
                                        height: 30,
                                          child: Row(children: <Widget>[
                                            Container(
                                              width:110,height:29,padding:EdgeInsets.only(top:2),
                                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(30),color: Color(0xffFF5C5C)),
                                              child: Text("Dental Care",textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.white,fontSize: 18),),
                                            ),
                                            Container(
                                              width:6,
                                            ),
                                            Container(
                                              width:92,height:29,padding: EdgeInsets.only(bottom: 6,top:0),
                                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(30),color: Color(0xffFF5C5C)),
                                              child: Text("Nutritious",textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.white,fontSize: 18),),
                                            ),
                                          ],

                                          )
                                      )
                                    ],

                                    )
                                  ),
                                ],),
                              ],
                            )
                          ),
                              flex:2
                          ),]
                    )//Container(width: 300, height: 100,color: Colors.amber)
                  ],
                  ),

                Column(
                  children: <Widget>[
                    Container(width: 340, height: 128, alignment: Alignment.topCenter,
                        child: Column(
                          children: <Widget>[
                            Text("NUTRITIONAL INFORMATION",
                                style: TextStyle(decoration:TextDecoration.underline,fontSize:17,color:Colors.black54,))
                            ,Image.asset('assets/treat_2.png')
                          ],
                        )),

                  ],
                ),

              ],
            ),

            ),
          ),
          /*Container(
              height: 200,
              child: RankTab()
          )*/
        ],
      ),
    );
  }

}
var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Color(0xffFF5C5C)),
    Icon(Icons.star, color: Color(0xffFF5C5C)),
    Icon(Icons.star, color: Color(0xffFF5C5C)),
    Icon(Icons.star, color: Color(0xffFF5C5C)),
    Icon(Icons.star_half, color: Color(0xffFF5C5C)),
  ],
);


