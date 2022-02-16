import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ProductScreen extends StatefulWidget {
  final String imgPath;
  final List<String> productInfo;
  const ProductScreen({Key? key, required this.imgPath, required this.productInfo}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late List<_ChartData> data = [
  _ChartData('Moisture', 10.0),
  _ChartData('Ash', 10.0),
  _ChartData('Crud_Fib', 6.8),
  _ChartData('Crud_Fat', 15.4),
  _ChartData('Crud_Pro', 28.2)
  ];

  late TooltipBehavior _tooltip = TooltipBehavior(enable: true);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Container(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: new AssetImage(widget.imgPath),
                    )
                  ),
              );
            }
            if (index == 1) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.productInfo[0], style: TextStyle(fontSize: 18, color: Colors.black54),),
                          Text(widget.productInfo[1], style: TextStyle(fontSize: 30),),
                          Text(widget.productInfo[2] + " / " + widget.productInfo[3], style: TextStyle(fontSize: 24),)
                        ],
                      )
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    width: 130,
                    child: Image.asset('assets/PetmilyAwards.png')
                  )
                ],
              );
            }
            if (index == 2){
              return Container(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                height: 180,
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
                        isTrackVisible: false,
                        trackColor: Colors.black12,
                        dataLabelSettings: DataLabelSettings(isVisible: true, )
                      )
                    ])
              );
            }
            if (index == 3) {
              return Container(
                margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Detail of Product', style: TextStyle(fontSize: 20),),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text('Original Ultra® formulas take a holistic approach to your dog’s well-being.'
                                  ' From helping to strengthen their immune system with proteins to helping support'
                                  ' their brain development with key nutrients, these premium dog foods care for the'
                                  ' whole body from head to tail.', style: TextStyle(fontSize: 18),),
                            ),
                          ),
                        ]
                      )
                    ),
                    Divider(
                      height: 20,
                      color: Colors.black,
                    )
                  ]
                )
              );
            }

            return ReviewBox(index: index-3);
          }
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

class ReviewBox extends StatelessWidget {
  const ReviewBox({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(5.0),
            width: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('User $index', style: TextStyle(fontSize: 20, color: Colors.redAccent, height: 1.2),),
                Text('P_Date', style: TextStyle(fontSize: 20, color: Colors.black),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      for( var i = 0 ; i < 5; i++ )
                        new IconTheme(
                          data: new IconThemeData(color: Colors.redAccent),
                          child: new Icon(Icons.star_rounded, size: 25,), // I want to iterate this "star icon" for reviews.ratings.length times
                        ),
                    ],
                  ),
                  Text('Title area of comment', style: TextStyle(fontSize: 20),),
                  Container(
                    child: Row(
                      children: [
                        Flexible(
                          child: Text('area of comment area of comment '
                          'area of comment area of comment area of comment area '
                          'of comment area of comment of comment area of comment', style: TextStyle(fontSize: 18, color: Colors.black54)),
                        )

                      ]
                    )
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
