import 'package:flutter/material.dart';

class ServiceBox extends StatefulWidget {
  @override
  _ServiceBoxState createState() => _ServiceBoxState();
}

class _ServiceBoxState extends State<ServiceBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(6.0),
        margin: EdgeInsets.fromLTRB(10.0, 35.0, 5.0, 3.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [BoxShadow(color: Color(0xb0dbdbdb), offset: Offset(4.0, 4.0), blurRadius: 4.0, spreadRadius: 0.2)],

        ),
        child: Column(
          children: <Widget>[
            Container(margin:EdgeInsets.fromLTRB(38,25,38,10),
              width: 62.0,
              height: 62.0,
              child: Image.asset('assets/cate/grooming.png', fit: BoxFit.fill)
            ),

            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(margin:EdgeInsets.fromLTRB(0,0,0,10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("GRO0OMING", style: TextStyle(fontSize: 18.0, color: Colors.black))
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
}
