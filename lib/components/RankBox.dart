import 'package:flutter/material.dart';

class RankBox extends StatefulWidget {
  final String tabName;
  final int idx;
  const RankBox({Key? key, required this.tabName, required this.idx}) : super(key: key);

  @override
  _RankBoxState createState() => _RankBoxState();
}

class _RankBoxState extends State<RankBox> {
 Map<String, List> productList = {"Food": [["Nurena", "Ultra Choice", "\$20.70", "18kg"],
                                        ["Pet Balance", "Chicken rice", "\$15.50", "10kg"],
                                        ["ANF", "6Free", "\$41.50", "6kg"],
                                        ["Natural Core", "Chic & Salm", "\$37.50", "7kg"],
                                        ["Wonder Dogs", "UZI Special", "\$11.95", "10kg"]],

                              "Treat": [["Rocco & Roxie", "Jerky stick", "\$9.97", "16oz"],
                                        ["Greenies", "Teenie", "\$15.50", "10oz"],
                                        ["Zuke's", "Training", "\$7.49", "5oz"],
                                        ["Wellness Natural", "Soft Natural", "\$5.73", "5oz"],
                                        ["Natural Balance", "Biscuits", "\$11.95", "14oz"]],

                              "Toy": [["Benebone", "Chew Toy", "\$11.59", "18kg"],
                                        ["Chuckit!", "Ultra Ball", "\$14.17", "2XL"],
                                        ["Mammoth", "Rope Tug", "\$9.78", "Large 25\""],
                                        ["Outward Hound", "Puzzle Plush", "\$13.98", "10kg"],
                                        ["Our Pets", "IQ Treat Ball", "\$13.84", "4 Inch"]],

                              "Stuff": [["Earth Rated", "Poop Bags", "\$6.50", "120 Bags"],
                                        ["Amazon Basics", "Pee Pads", "\$25.08", "25 count"],
                                        ["Fresh Step", "Febreze", "\$9.49", "0.04oz"],
                                        ["Glad", "Training Pads", "\$14.29", "10 count"],
                                        ["Nutramax", "Supplement", "\$18.99", "60 count"]]};

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
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
            child: Image.asset('assets/image/productImg/product' + widget.tabName + widget.idx.toString() + ".jpg", fit: BoxFit.fill)
          ),
          SizedBox(height: 4.0),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text((widget.idx + 1).toString() + ". " + productList[widget.tabName]?[widget.idx][0], style: TextStyle(fontSize: 14.0, color: Colors.black54)),
                      Text(productList[widget.tabName]![widget.idx][1], style: TextStyle(fontSize: 18.0, color: Colors.black))
                    ]
                  )
                ),
                Container(
                  child: Text(productList[widget.tabName]![widget.idx][2], style: TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            )
          )

        ]
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
