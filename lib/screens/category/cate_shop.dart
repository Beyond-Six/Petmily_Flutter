import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class cate_shop extends StatefulWidget{
  @override
  _cate_shopState createState() => _cate_shopState();
}
class _cate_shopState extends State<cate_shop>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
         Column(//1
              children: <Widget>[
                Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                    children : <Widget>[
                      Container( width:185,height:55, margin: EdgeInsets.only(top:15), decoration: BoxDecoration(color: Color(0xa3f1cbcb), ),
                          child: Center(child:
                          Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[Image.asset('assets/cate/dog-bowl.png',height: 38,width:38),
                              Text(" FOOD",style: TextStyle(fontSize: 35),textAlign:TextAlign.right,),],),)),
                      Container( width:185,height:55, padding: EdgeInsets.only(left:8,top:9),margin: EdgeInsets.only(top:15), decoration: BoxDecoration(color: Color(
                          0x41ffdddd), border: Border.all(color: Color(
                          0xC2AAAAC3)),),
                            child: Text("Dry Food",style: TextStyle(fontSize: 20),textAlign:TextAlign.start,),),])],),
        Column(children: <Widget>[//2
                Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                    children : <Widget>[
                      Container( width:185,height:55, padding: EdgeInsets.only(left:8,top:9), decoration: BoxDecoration(color: Color(
                          0x41ffdddd), border: Border.all(color: Color(0xC2AAAAC3)),),
                        child: Text("Wet Food",style: TextStyle(fontSize: 20),textAlign:TextAlign.start),),
                      Container( width:185,height:55, padding: EdgeInsets.only(left:8,top:9), decoration: BoxDecoration(color: Color(
                          0x41ffdddd), border: Border.all(color: Color(0xC2AAAAC3)),),
                        child: Text("Veterinary Diets",style: TextStyle(fontSize: 20),textAlign:TextAlign.start))])],
            ),
        Column(children: <Widget>[//3
          Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
              children : <Widget>[
                Container( width:185,height:55, padding: EdgeInsets.only(left:8,top:9), decoration: BoxDecoration(color: Color(
                    0x41ffdddd), border: Border.all(color: Color(0xC2AAAAC3)),),
                  child: Text("Human-Grade Food",style: TextStyle(fontSize: 20),textAlign:TextAlign.start),),
                Container( width:185,height:55, padding: EdgeInsets.only(left:8,top:9), decoration: BoxDecoration(color: Color(
                    0x41ffdddd), border: Border.all(color: Color(0xC2AAAAC3)),),
                  child: Text("Grain Free Food",style: TextStyle(fontSize: 20),textAlign:TextAlign.start))])],
        ),
        Column(
          children: <Widget>[
            Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                children : <Widget>[
                  Container( width:185,height:55, margin: EdgeInsets.only(top:15), decoration: BoxDecoration(color: Color(0x8af1cbcb), ),
                      child: Center(child:
                      Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Image.asset('assets/cate/dog.png',height: 38,width:38),
                          Text(" TREAT",style: TextStyle(fontSize: 35),textAlign:TextAlign.right,),],),)),
                  Container( width:185,height:55, padding: EdgeInsets.only(left:8,top:9),margin: EdgeInsets.only(top:15), decoration: BoxDecoration(color: Color(0x41ffdddd), border: Border.all(color: Color(
                      0xC2AAAAC3)),),
                    child: Text("Biscuits",style: TextStyle(fontSize: 20),textAlign:TextAlign.start,),),])],),
        Column(children: <Widget>[
          Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
              children : <Widget>[
                Container( width:185,height:55, padding: EdgeInsets.only(left:8,top:9),decoration: BoxDecoration(color: Color(0x41ffdddd), border: Border.all(color: Color(0xC2AAAAC3)),),
                  child: Text("Soft&Chewy",style: TextStyle(fontSize: 20),textAlign:TextAlign.start),),
                Container( width:185,height:55, padding: EdgeInsets.only(left:8,top:9),decoration: BoxDecoration(color: Color(0x41ffdddd), border: Border.all(color: Color(0xC2AAAAC3)),),
                    child: Text("Dental",style: TextStyle(fontSize: 20),textAlign:TextAlign.start))])],
        ),
        Column(children: <Widget>[
          Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
              children : <Widget>[
                Container( width:185,height:55,padding: EdgeInsets.only(left:8,top:9), decoration: BoxDecoration(color: Color(0x41ffdddd), border: Border.all(color: Color(0xC2AAAAC3)),),
                  child: Text("Jerky",style: TextStyle(fontSize: 20),textAlign:TextAlign.start),),
                Container( width:185,height:55,padding: EdgeInsets.only(left:8,top:9), decoration: BoxDecoration(color: Color(0x41ffdddd), border: Border.all(color: Color(0xC2AAAAC3)),),
                    child: Text("Training",style: TextStyle(fontSize: 20),textAlign:TextAlign.start))])],
        ),
        Column(children: <Widget>[
          Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
              children : <Widget>[
                Container( width:185,height:55,padding: EdgeInsets.only(left:8,top:9), decoration: BoxDecoration(color: Color(0x41ffdddd), border: Border.all(color: Color(0xC2AAAAC3)),),
                  child: Text("Bones",style: TextStyle(fontSize: 20),textAlign:TextAlign.start),),
                Container( width:185,height:55,padding: EdgeInsets.only(left:8,top:9), decoration: BoxDecoration(color: Color(0x41ffdddd), border: Border.all(color: Color(0xC2AAAAC3)),),
                    child: Text("Chews",style: TextStyle(fontSize: 20),textAlign:TextAlign.start))])],
        ),

      ],
    );
  }

}