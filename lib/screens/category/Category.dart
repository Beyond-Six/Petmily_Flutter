import 'package:flutter/material.dart';
import 'package:new_project/screens/category/cate_shop4.dart';
import 'package:new_project/screens/recommend/RecommendHome.dart';
import 'package:new_project/screens/recommend/RecommendHome2.dart';
import 'package:new_project/screens/recommend/RecommendHome3.dart';
import 'package:new_project/screens/recommend/RecommendHome4.dart';

import 'cate_shop.dart';
import 'cate_shop2.dart';
import 'cate_shop3.dart';

class Category extends StatefulWidget{
  @override
  _CategoryState createState() => _CategoryState();
}
class _CategoryState extends State<Category> with TickerProviderStateMixin{

  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
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
                child: Text("Shop", style: TextStyle(fontSize: 20.0))
            ),

            Container(
                child: Text("Brand", style: TextStyle(fontSize: 20.0))
            ),

          ],
          labelColor: Color(0xffFF5C5C),
          unselectedLabelColor: Colors.black26,
          controller: _tabController,

        ),
      ),
          Center(
              child: Container(
                  width: 370, height: 630,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      cate_shop2(),
                      cate_shop4(),
                    ],
                  )
              )),
        /**/
    ]));
  }
  
}


