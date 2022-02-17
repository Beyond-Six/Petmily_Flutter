import 'package:flutter/material.dart';
import 'package:new_project/components/RankTab.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RecommendHome extends StatefulWidget{
  @override
  _RecommendHomeState createState() => _RecommendHomeState();
}
class _RecommendHomeState extends State<RecommendHome>{
  late List<_ChartData> data = [
    _ChartData('Moisture', 15.0),
    _ChartData('Crud_Fib', 8.8),
    _ChartData('Crud_Pro', 28.2)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( //추천 서비스 큰 박스
        children: <Widget>[
          Container( //그위에 텍스트
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text:"Today's Food for ",style: TextStyle(fontSize: 30,)),
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
                          height:200,child:Image.asset('assets/cat_food.png',fit:BoxFit.cover)
                        ),
                            flex:1
                        ),
                          Expanded(child: Container(
                              height:188,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
                                  Container(
                                      child: Text("Royal Canin",
                                          style: TextStyle(fontSize: 15,color: Colors.black26,)),
                                    height:18,
                                  ),
                                ],),
                                Column(children: <Widget>[
                                  Container(
                                    child: Text("FIT",
                                        style: TextStyle(fontSize: 26,color: Colors.black,)),
                                    height:28,
                                  ),
                                ],),
                                Column(children: <Widget>[
                                  Container(
                                      height:20,child: stars,
                                  ),
                                ],),
                                Column(children: <Widget>[
                                  Container(
                                    child:Text("4.6 (203)",style: TextStyle(fontSize:17,color:Colors.black54,)),
                                    height:20,
                                  ),
                                ],),
                                Column(children: <Widget>[
                                  Container(
                                    child: Text("10kg / \$90",
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
                                              width:70,height:25,padding: EdgeInsets.only(bottom: 6,top:0),
                                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(30),color: Color(0xffFF5C5C)),
                                              child: Text("DRY",textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white,fontSize: 18),),
                                          ),
                                          Container(
                                            width:6,
                                          ),
                                          Container(
                                            width:110,height:25,padding: EdgeInsets.only(bottom: 6,top:0),
                                            decoration: BoxDecoration(borderRadius:BorderRadius.circular(30),color: Color(0xffFF5C5C)),
                                            child: Text("1~7 years",textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white,fontSize: 17),),
                                          ),
                                        ],

                                        )
                                      ),
                                      Container(
                                        height: 30,
                                          child: Row(children: <Widget>[
                                            Container(
                                              width:120,height:25,padding:EdgeInsets.only(top:2),
                                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(30),color: Color(0xffFF5C5C)),
                                              child: Text("Weight Control",textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.white,fontSize: 16),),
                                            ),
                                            Container(
                                              width:6,
                                            ),
                                            Container(
                                              width:92,height:25,padding: EdgeInsets.only(bottom: 6,top:0),
                                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(30),color: Color(0xffFF5C5C)),
                                              child: Text("Hairball",textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.white,fontSize: 17),),
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
                                style: TextStyle(decoration:TextDecoration.underline,fontSize:17,color:Colors.black54,)),
                            // Image.asset('assets/ev2.png')
                            Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                height: 98,
                                child: SfCartesianChart(
                                    plotAreaBorderWidth: 0,
                                    primaryXAxis: CategoryAxis(
                                        majorGridLines: MajorGridLines(width: 0)
                                    ),
                                    primaryYAxis: NumericAxis(
                                        isVisible: false,
                                        minimum: 0,
                                        maximum: 40,
                                        interval: 10,
                                        majorGridLines: MajorGridLines(width: 0)
                                    ),
                                    series: <ChartSeries<_ChartData, String>>[
                                      BarSeries<_ChartData, String>(
                                          dataSource: data,
                                          xValueMapper: (_ChartData data, _) => data.x,
                                          yValueMapper: (_ChartData data, _) => data.y,
                                          color: Color(0xffFF5C5C),
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6)),
                                          isTrackVisible: true,
                                          trackColor: Colors.black12,
                                          dataLabelSettings: DataLabelSettings(isVisible: true, ),

                                      )
                                    ])
                            )
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

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
