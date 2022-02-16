import 'package:flutter/material.dart';

class BrandBar extends StatefulWidget {
  const BrandBar({Key? key}) : super(key: key);

  @override
  _BrandBarState createState() => _BrandBarState();
}

class _BrandBarState extends State<BrandBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Popular Brands", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500)),
          Container(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index){
                  return BrandBox(idx: index);
                }
            )
          )
        ],
      )
    );
  }
}

class BrandBox extends StatefulWidget {
  final int idx;
  const BrandBox({Key? key, required this.idx}) : super(key: key);

  @override
  _BrandBoxState createState() => _BrandBoxState();
}

class _BrandBoxState extends State<BrandBox> {
  List<String> brandName = ["Natural Balance", "ANF", "ROYAL CANIN", "HIll\'s", "PETSTLER"];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 110,
            height: 110,
            child:Image.asset("assets/image/brandImg/brandImg" + widget.idx.toString() + ".jpg")
          ),
          Text(brandName[widget.idx], style: TextStyle(),)
        ],
      ),
    );
  }
}

