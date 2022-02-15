import 'package:flutter/material.dart';
import 'package:new_project/screens/recommend/RecommendHome.dart';
import 'package:new_project/screens/recommend/RecommendHome2.dart';
import 'package:new_project/screens/recommend/RecommendHome3.dart';
import 'package:new_project/screens/recommend/RecommendHome4.dart';

class Category extends StatefulWidget{
  @override
  _CategoryState createState() => _CategoryState();
}
class _CategoryState extends State<Category> with TickerProviderStateMixin{

  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
      Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        Container(
        width: 330,padding:EdgeInsets.only(top: 6),
        child: TabBar(indicatorColor: Color(0xffFF5C5C),
          tabs: [
            Container(
                child: Text("Shop", style: TextStyle(fontSize: 16.0))
            ),
            Container(
                child: Text("Service", style: TextStyle(fontSize: 16.0))
            ),
            Container(
                child: Text("Brand", style: TextStyle(fontSize: 16.0))
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
                    ],
                  )
              )),
        /*Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  Row(
                    children : <Widget>[
                      Container( width:180,height:60,color: Colors.indigo,
                        child: Text("HI"), margin: EdgeInsets.only(left:10,right:10),
                      ),
                      Container( width:180,height:60,color: Colors.blue,
                          child: Text("HI")
                      ),
                    ]
                  )
                ],
              )
            )
          ],
        )*/
    ]));
  }
  
}


