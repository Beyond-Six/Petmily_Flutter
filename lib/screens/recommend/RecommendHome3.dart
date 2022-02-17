import 'package:flutter/material.dart';
import 'package:new_project/components/RankTab.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RecommendHome3 extends StatefulWidget{
  @override
  _RecommendHome3State createState() => _RecommendHome3State();
}
class _RecommendHome3State extends State<RecommendHome3>{
  late List<_ChartData> data = [
    _ChartData('Quality', 4.0),
    _ChartData('Value', 4.0),
    _ChartData('Pet Satisfaction', 4.3)
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
                  TextSpan(text:"Today's Toy for ",style: TextStyle(fontSize: 30,)),
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
                          height:200,child:Image.asset('assets/toy2.png',fit:BoxFit.fitWidth)
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
                                      child: Text("KONG",
                                          style: TextStyle(fontSize: 15,color: Colors.black26,)),
                                    height:18,
                                  ),
                                ],),
                                Column(children: <Widget>[
                                  Container(
                                    child: Text("Cozie Spunky Monkey",
                                        style: TextStyle(fontSize: 23,color: Colors.black,)),
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
                                    child:Text("4.0 (82)",style: TextStyle(fontSize:17,color:Colors.black54,)),
                                    height:20,
                                  ),
                                ],),
                                Column(children: <Widget>[
                                  Container(
                                    child: Text("8 in / \$5.49",
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
                                              width:130,height:27,padding: EdgeInsets.only(bottom: 6,top:0),
                                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(30),color: Color(0xffFF5C5C)),
                                              child: Text("Light Chewing",textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white,fontSize: 17),),
                                          ),
                                          Container(
                                            width:6,
                                          ),
                                          Container(
                                            width:70,height:27,padding: EdgeInsets.only(bottom: 6,top:0),
                                            decoration: BoxDecoration(borderRadius:BorderRadius.circular(30),color: Color(0xffFF5C5C)),
                                            child: Text("Dogs",textAlign: TextAlign.center,
                                              style: TextStyle(color: Colors.white,fontSize: 17),),
                                          ),
                                        ],

                                        )
                                      ),
                                      Container(
                                        height: 30,
                                          child: Row(children: <Widget>[
                                            Container(
                                              width:120,height:27,padding:EdgeInsets.only(top:2),
                                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(30),color: Color(0xffFF5C5C)),
                                              child: Text("Noisemaking",textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.white,fontSize: 16),),
                                            ),
                                            Container(
                                              width:6,
                                            ),
                                            Container(
                                              width:80,height:27,padding: EdgeInsets.only(bottom: 6,top:0),
                                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(30),color: Color(0xffFF5C5C)),
                                              child: Text("Fetch",textAlign: TextAlign.center,
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
                            Text("REAL USER\'s REVIEW",
                                style: TextStyle(decoration:TextDecoration.underline,fontSize:17,color:Colors.black54,)),
                            // ,Image.asset('assets/toy3.png'),
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
                                        maximum: 5,
                                        interval: 1,
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
    Icon(Icons.star_border, color: Color(0xffFF5C5C)),
  ],
);

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}


