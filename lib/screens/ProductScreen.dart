import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
          itemCount: 7,
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

class ReviewBox extends StatefulWidget {
  const ReviewBox({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _ReviewBoxState createState() => _ReviewBoxState();
}

class _ReviewBoxState extends State<ReviewBox> {
  late List<_reviewData> data = [
    _reviewData("Peri", "2022-02-17", "Very nice Product",
        "We got this from a coupon expecting our dog wouldn’t care for "
            "it because she’s never been one to like dry food. First day "
            "we put it out she ate the whole thing and begged for more! We’ll be buying again", 4.8),
    _reviewData("Tai", "2022-02-10", "I love olly's always dose a great one.",
        "My rescue dogs have been eating this food for 5 years now and are supe"
            "r healthy and fit. They both eat it happily at every meal and have "
            "had no stomach issues ever. This is a quality food and fairly reasonably priced.", 4.2),
    _reviewData("Gina", "2022-01-29", "I high  Recommend this one.",
        "I love the food and will continue to buy it cause my Fur baby"
            "'s love it but still really wished there was a 50lb bag for Small breeds", 4.6),
    _reviewData("Henry", "2022-01-06", "My dog loves this food.",
        "We have two dogs and we really had to search to find a food that worked"
            " for both of them. So this was a win for us! They both like it and"
            " digest it well, and both are very healthy.", 4.0),
  ];

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
                  Text(data[widget.index].name, style: TextStyle(fontSize: 24, color: Colors.redAccent, height: 1.2),),
                  Text(data[widget.index].date, style: TextStyle(fontSize: 14, color: Colors.black),),
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
                        children: [
                          RatingBarIndicator(
                            rating: data[widget.index].rate,
                            itemBuilder: (context, index) => Icon(
                              Icons.star_rounded,
                              color: Colors.redAccent,
                            ),
                            itemCount: 5,
                            itemSize: 28.0,
                            direction: Axis.horizontal,
                          ),
                          Text(data[widget.index].rate.toString(), style: TextStyle(fontSize: 15, color: Colors.black38))
                        ]
                    ),
                    Text(data[widget.index].title, style: TextStyle(fontSize: 20),),
                    Container(
                        child: Row(
                            children: [
                              Flexible(
                                child: Text(data[widget.index].content, style: TextStyle(fontSize: 18, color: Colors.black54)),
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


class _reviewData{
  _reviewData(this.name, this.date, this.title, this.content, this.rate);

  final String name;
  final String date;
  final String title;
  final String content;
  final double rate;
}