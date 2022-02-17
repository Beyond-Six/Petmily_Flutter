import 'package:flutter/material.dart';
import 'package:new_project/screens/RankListScreen.dart';
import 'package:new_project/screens/recommend/RecommendHome.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ServiceBox extends StatefulWidget {
  final String tabName;
  final int idx;
  const ServiceBox({Key? key, required this.tabName, required this.idx}) : super(key: key);
  @override
  _ServiceBoxState createState() => _ServiceBoxState();
}

class _ServiceBoxState extends State<ServiceBox> {

  @override
  Widget build(BuildContext context) {
    return InkWell(

      child: Container(
        padding: const EdgeInsets.all(6.0),
        margin: EdgeInsets.fromLTRB(10.0, 35.0, 5.0, 3.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(4.0, 4.0), blurRadius: 6.0, spreadRadius: 0.2)],

        ),
        child: Column(
          children: <Widget>[
            Container(margin:EdgeInsets.fromLTRB(38,25,38,10),
              width: 67.0,
              height: 67.0,
              child: Image.asset('assets/cate/service'+widget.idx.toString()+".png",fit: BoxFit.contain,)
            ),

            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(margin:EdgeInsets.fromLTRB(0,0,0,10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.tabName, style: TextStyle(fontSize: 16.0, color: Colors.black))
                      ]
                    )
                  ),
                ],
              )
            )

          ]
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
