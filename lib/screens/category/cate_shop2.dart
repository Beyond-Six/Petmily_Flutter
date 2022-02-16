import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/screens/recommend/RecommendHome.dart';
class cate_shop2 extends StatefulWidget{
  @override
  _cate_shop2State createState() => _cate_shop2State();
}
class _cate_shop2State extends State<cate_shop2>{

  Widget akak(String str){
    return Container( height: 37,width: 300,alignment: Alignment.centerLeft,
        padding: EdgeInsets.zero,margin: EdgeInsets.only(left: 30),decoration: BoxDecoration(
            border: Border(bottom:BorderSide(width: 1.0,color: Color(0xC2AAAAC3)))),
        child:TextButton(
            onPressed: (){Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecommendHome())); },
            child: Text(str,style: TextStyle(fontSize: 18,color: Color(0xff2C3440)))
        )
    );
  }
  String dropdownValue='Dog';
  @override
  Widget build(BuildContext context) {
    const fortext = TextStyle(fontSize: 20,color: Color(0xff2C3440));

    // TODO: implement build
    return ListView(
        children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Container( padding: EdgeInsets.only(left: 7), margin: EdgeInsets.only(left:30,top:15,bottom:3),width:150,height:50,decoration: BoxDecoration(borderRadius:BorderRadius.circular(7),color: Color(0xffFFEDE2)),
                    child: Center(
                      child: Row(
                        children: <Widget>[Image.asset('assets/cate/dog-bowl.png',color: Color(0xffFF5C5C),height: 38,width:38),
                          Text(" FOOD",style: TextStyle(fontSize: 35,color: Color(0xffFF5C5C))),],),
                    ),
                  ),

                  Container(
                    width: 90, height:33, alignment: Alignment.centerRight, margin: EdgeInsets.only(left:60,top:15,bottom:3),
                      decoration: BoxDecoration(
                          border: Border(bottom:BorderSide(width: 2,color: Color(0xffFF5C5C)))),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon:  Icon(Icons.arrow_downward, color: Color(0xffFF5C5C)),
                      elevation: 16,
                      style: TextStyle(color: Color(0xffFF5C5C),fontFamily:'BalooBhaijaan',fontSize: 20),
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                        items: <String>['Dog', 'Cat', 'Fish', 'Reptile','Turtle'].map<DropdownMenuItem<String>>((String value){
                          return DropdownMenuItem<String>(value: value,child: Text(value),);
                        }).toList(),
                    )
                  )
                ],
              )
              ,akak("Dry Food"),akak("Wet Food"),akak("Veterinary Diets"),
              akak("Minimally Processed Dog Food"),akak("Grain Free Food"),
              akak("Human-Grade Food"),akak("Puppy Food")
                ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container( padding: EdgeInsets.only(left: 7), margin: EdgeInsets.only(left:30,top:15,bottom:3),width:160,height:50,decoration: BoxDecoration(borderRadius:BorderRadius.circular(7),color: Color(0xffFFEDE2)),
                child: Center(
                  child: Row(
                    children: <Widget>[Image.asset('assets/cate/dog.png',color: Color(0xffFF5C5C),height: 38,width:38),
                      Text(" TREAT",style: TextStyle(fontSize: 35,color: Color(0xffFF5C5C))),],),
                ),
              )
              ,akak("Biscuits & Crunchy Treats"),akak("Soft & Chewy Treats"),akak("Dental Treats"),
              akak("Jerky Treats"),akak("Training Treats"),
              akak("Bones & Chews")
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container( padding: EdgeInsets.only(left: 7), margin: EdgeInsets.only(left:30,top:15,bottom:3),width:200,height:50,decoration: BoxDecoration(borderRadius:BorderRadius.circular(7),color: Color(0xffFFEDE2)),
                child: Center(
                  child: Row(
                    children: <Widget>[Image.asset('assets/cate/toys.png',color: Color(0xffFF5C5C),height: 38,width:38),
                      Text(" SUPPLIES",style: TextStyle(fontSize: 35,color: Color(0xffFF5C5C))),],),
                ),
              )
              ,akak("Clothes & Accessories"),akak("Gates, Doors, and Pens"),akak("Bowls & Feeders"),
              akak("Collars, Leashes, and Harnesses"),akak("Crates & Kennels"),
              akak("Electronic Supplies & Trackers"),akak("Grooming") ,
              akak("Poop Bags & Cleaning Supplies"),akak("Training & Behavior")
            ],
          ),
        ]
    );
  }

}
