import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/screens/recommend/RecommendHome.dart';
class cate_shop4 extends StatefulWidget{
  @override
  _cate_shop4State createState() => _cate_shop4State();
}
class _cate_shop4State extends State<cate_shop4>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
        children: <Widget>[
          SizedBox(height: 20,)
          ,Image.asset('assets/cate/brands.png')
          ]
    );
  }

}
