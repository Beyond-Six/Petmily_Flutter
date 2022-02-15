import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/MainPage.dart';
import 'package:new_project/components/RankBox.dart';
import 'package:new_project/screens/category/Category.dart';
import 'package:new_project/screens/recommend/RecommendHome.dart';
import 'package:new_project/screens/recommend/RecommendHome2.dart';
import 'package:new_project/screens/recommend/RecommendHome3.dart';
import 'package:new_project/screens/recommend/RecommendHome4.dart';

class RankTab2 extends StatefulWidget {
  const RankTab2({Key? key}) : super(key: key);

  @override
  _RankTab2State createState() => _RankTab2State();
}

class _RankTab2State extends State<RankTab2> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 330,padding:EdgeInsets.only(top: 6),
          child: TabBar(indicatorColor: Color(0xffFF5C5C),
            tabs: [
              Container(
                  child: Text("Food", style: TextStyle(fontSize: 18.0))
              ),
              Container(
                  child: Text("Treat", style: TextStyle(fontSize: 18.0))
              ),
              Container(
                  child: Text("Toy", style: TextStyle(fontSize: 18.0))
              ),
              Container(
                  child: Text("Stuff", style: TextStyle(fontSize: 18.0))
              ),

            ],
            labelColor: Color(0xffFF5C5C),
            unselectedLabelColor: Colors.black26,
            controller: _tabController,
          ),
        ),
        Center(
            child: Container(
            width: 370, height: 420,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RecommendHome(),
                    RecommendHome2(),
                    RecommendHome3(),
                    RecommendHome4(),
                  ],
                )
        )),
        Container(
            height: 165,
            child: TabBarView(
              controller: _tabController,
              children: [
                RankTabList(tabName: "Food"),
                RankTabList(tabName: "Traet"),
                RankTabList(tabName: "Toy"),
                RankTabList(tabName: "Stuff"),
              ],
            )),
        OutlinedButton.icon( onPressed: () { Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Category())); },
          icon: Icon(Icons.category, size: 23,color: Color(0xff2C3440)),
          label: Text("Show More Category",style: TextStyle(color:Color(0xff2C3440),fontSize: 20),),
          style: OutlinedButton.styleFrom(side: BorderSide(width: 5.0,color: Color(0xffFF5C5C),style: BorderStyle.solid,),
          )
        )
      ],
    );
  }
}

class RankTabList extends StatefulWidget {
  final String tabName;
  const RankTabList({Key? key, required this.tabName}) : super(key: key);

  @override
  _RankTabListState createState() => _RankTabListState();
}

class _RankTabListState extends State<RankTabList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index){
            return RankBox(tabName: widget.tabName, idx: index);
          },
        )
    );
  }
}