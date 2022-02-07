import 'package:flutter/material.dart';

class RankBox extends StatefulWidget {
  @override
  _RankBoxState createState() => _RankBoxState();
}

class _RankBoxState extends State<RankBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      margin: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(4.0, 4.0), blurRadius: 6.0, spreadRadius: 0.2)],

      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            child: Image.asset('assets/product.png', fit: BoxFit.fill)
          ),
          SizedBox(height: 4.0),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("X. Brand Name", style: TextStyle(fontSize: 14.0, color: Colors.black54)),
                      Text("Product Name", style: TextStyle(fontSize: 18.0, color: Colors.black))
                    ]
                  )
                ),
                SizedBox(width: 12),
                Container(
                  child: Text("\$13.14", style: TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            )
          )

        ]
      ),
    );
  }
}
