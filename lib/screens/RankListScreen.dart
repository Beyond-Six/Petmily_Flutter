import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:new_project/screens/ServiceScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class RankListScreen extends StatefulWidget {
  const RankListScreen({Key? key}) : super(key: key);

  @override
  _RankListScreenState createState() => _RankListScreenState();
}

class _RankListScreenState extends State<RankListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    // decoration: BoxDecoration(
                    //     border: Border(bottom:BorderSide(width: 2,color: Color(0xffFF5C5C)))),
                    child: Text('Grooming', style: TextStyle(fontSize: 28, color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500, height: 1.6),)
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  color: Color(0xffFF5C5C),
                  width: 145,
                  height: 2,
                )
              ],
            );
          }

            return RankListComponent(index: index-1);
          }
      )
    );
  }
}

class RankListComponent extends StatefulWidget {
  const RankListComponent({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<RankListComponent> createState() => _RankListComponentState();
}

class _RankListComponentState extends State<RankListComponent> {
  bool favButtonSelected = false;

  late List<_GroomingInfo> data = [
    _GroomingInfo("Eagle Mobile Pet Grooming", 4.4, 20, "649 Catamaran St Apt 02, Foster City, CA", "+1 650-278-3611"),
    _GroomingInfo("The Dog Pawlor", 4.4, 66, "1325 S Winchester Blvd, San Jose, CA" ,"+1 650-278-3611"),
    _GroomingInfo("Showtime Pet Grooming", 4.6, 54, "104 Race St, San Jose, CA" ," +1 408-292-7387"),
    _GroomingInfo("All 4's Grooming", 4.4, 54, "347 Lincoln Ave, San Jose, CA" ,"+1 408-298-6435"),
    _GroomingInfo("Lush Spaw", 4.5, 90, "700 S Winchester Blvd Suite 60, San Jose, CA" ,"+1 833-279-5874")
  ];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        pushNewScreen(
            context,
            screen: ServiceScreen(
                imgPath: 'assets/image/service/groomingImg' + widget.index.toString(),
                serviceInfo: [
                  data[widget.index].name,
                  data[widget.index].rate,
                  data[widget.index].adress,
                  data[widget.index].contactNum
                ]
            ),
            withNavBar: true,
            pageTransitionAnimation: PageTransitionAnimation.fade
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 110,
        child: Row(
          children: [
            Text('${widget.index+1}', style: TextStyle(fontSize: 20),),
            Container(
              margin: EdgeInsets.all(10),
              child: Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/image/service/groomingImg' + widget.index.toString() + '.png')
                )
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      child: Text(data[widget.index].name, style: TextStyle(fontSize: 22, height: 1.2), overflow: TextOverflow.ellipsis),
                    ),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBarIndicator(
                        rating: data[widget.index].rate,
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: Colors.redAccent,
                        ),
                        itemCount: 5,
                        itemSize: 25.0,
                        direction: Axis.horizontal,
                      ),
                      SizedBox(width: 5),
                      Text(data[widget.index].rate.toString(), style: TextStyle(fontSize: 15)),
                      Text("  Review(" + data[widget.index].review.toString() + ")", style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  Text(data[widget.index].adress, style: TextStyle(fontSize: 15, height: 1.4),),
                  Text(data[widget.index].contactNum, style: TextStyle(fontSize: 15, color: Colors.red.shade200, height: 1.4),),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

class _GroomingInfo{
  _GroomingInfo(this.name, this.rate, this.review, this.adress, this.contactNum);

  final String name;
  final double rate;
  final int? review;
  final String adress;
  final String contactNum;
}


