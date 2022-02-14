import 'package:flutter/material.dart';
import 'package:new_project/components/RankBox.dart';

class RankTab extends StatefulWidget {
  const RankTab({Key? key}) : super(key: key);

  @override
  _RankTabState createState() => _RankTabState();
}

class _RankTabState extends State<RankTab> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 300,
          child: TabBar(
            tabs: [
              Container(
                  child: Text("Food", style: TextStyle(fontSize: 18.0))
              ),
              Container(
                  child: Text("Treat", style: TextStyle(fontSize: 18.0))
              ),
              Container(
                  child: Text("Toy", style: TextStyle(fontSize: 18.0))
              ),
              Container(
                  child: Text("Stuff", style: TextStyle(fontSize: 18.0))
              )
            ],
            indicator: BoxDecoration(

            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black26,
            controller: _tabController,
          ),
        ),

        Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                RankTabList(),
                RankTabList(),
                RankTabList(),
                RankTabList(),
              ],
            ))
      ],
    );
  }
}

class RankTabList extends StatefulWidget {
  const RankTabList({Key? key}) : super(key: key);

  @override
  _RankTabListState createState() => _RankTabListState();
}

class _RankTabListState extends State<RankTabList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
                child: RankBox()
            ),
            Container(
                child: RankBox()
            ),
            Container(
                child: RankBox()
            ),
            Container(
                child: RankBox()
            ),
            Container(
                child: RankBox()
            )
          ],
        )
    );
  }
}
