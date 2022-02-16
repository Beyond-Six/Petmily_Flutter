import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:new_project/screens/RankListScreen.dart';

class ServiceScreen extends StatefulWidget {
  final String imgPath;
  final List<dynamic> serviceInfo;
  const ServiceScreen({Key? key, required this.imgPath, required this.serviceInfo}) : super(key: key);

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  late List<_ChartData> data = [
    _ChartData('Clean', 60.4),
    _ChartData('Kindness', 70.2),
    _ChartData('Quality', 59.8),
    _ChartData('Parking', 40.4),
    _ChartData('Satis', 58.2)
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
                      fit: BoxFit.cover,
                      image: new AssetImage(widget.imgPath + "_sub.png"),
                    )
                ),
              );
            }
            if (index == 1) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.serviceInfo[0], style: TextStyle(fontSize: 34, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600, height: 1.2),),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: widget.serviceInfo[1],
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star_rounded,
                                    color: Colors.redAccent,
                                  ),
                                  itemCount: 5,
                                  itemSize: 30.0,
                                  direction: Axis.horizontal,
                                ),
                                Text(widget.serviceInfo[1].toString(), style: TextStyle(fontSize: 20, color: Colors.black54),),
                              ],
                            ),

                            Row(
                              children: [
                                Icon(Icons.home_rounded, size: 20,),
                                Text(widget.serviceInfo[2], style: TextStyle(fontSize: 18, height: 1.4),),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.phone, size: 20, color: Colors.red.shade200,),
                                Text(widget.serviceInfo[3], style: TextStyle(fontSize: 18, color: Colors.red.shade200, height: 1.4),),
                              ],
                            ),

                          ],
                        )
                    ),
                  ),
                ],
              );
            }
            if (index == 2){
              return Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  height: 160,
                  child: SfCartesianChart(
                      plotAreaBorderWidth: 0,
                      primaryXAxis: CategoryAxis(
                          majorGridLines: MajorGridLines(width: 0)
                      ),
                      primaryYAxis: NumericAxis(
                          isVisible: false,
                          minimum: 0,
                          maximum: 100,
                          interval: 10,
                          majorGridLines: MajorGridLines(width: 0)
                      ),
                      series: <ChartSeries<_ChartData, String>>[
                        BarSeries<_ChartData, String>(
                            dataSource: data,
                            xValueMapper: (_ChartData data, _) => data.x,
                            yValueMapper: (_ChartData data, _) => data.y,
                            color: Theme.of(context).primaryColor,
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
    _reviewData("Ante", "2022-02-17", "The employees are VERY polite.",
    "professional, and knowledgeable. The price is average for the "
    "industry and the facilities are impeccable. My dog came out "
    "of there smelling SOOOOOO good and EXTREMELY happy!!", 4.8),
    _reviewData("Lilia", "2022-02-10", "I love olly's always dose a great job.",
    "with my Dogs. Which is hard to deal with when it comes to there nails."
    " Try to image a  Great Dane pit mixs and a Siberian husky mix at home"
    " by yourself and running after them to get there nails done after a bath.", 4.2),
    _reviewData("Jay", "2022-02-04", "I high  Recommend this place.",
        "with my Dogs. Which is hard to deal with when it comes to there nails."
            " great staff great price does a great job. And tops it all off you get"
            " to be the good guy by the end of the day.", 4.6),
    _reviewData("Lisa", "2022-02-01", "The staff is courteous and friendly.",
        "We drove 15 miles to get our Portie his very first grooming session and"
            " it was worth the drive. The lady I spoke to on the phone few days earlier"
            " was very patient given that I am first time dog parent and was not really"
            " sure how things are done at the groomers. The staff is courteous and friendly;"
            " the place is clean and tidy; the dogs are kept in rooms with doors. Very reasonable in price.", 4.0),
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


