import 'package:flutter/material.dart';
import 'package:new_project/screens/ProductScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class RankListScreen extends StatefulWidget {
  const RankListScreen({Key? key}) : super(key: key);

  @override
  _RankListScreenState createState() => _RankListScreenState();
}

class _RankListScreenState extends State<RankListScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38, width: 2),
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Text('Category', style: TextStyle(fontSize: 28),)
            );
          }

            return RankListComponent(index: index);
          }
      )
    );
  }
}

class RankListComponent extends StatefulWidget {
  const RankListComponent({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<RankListComponent> createState() => _RankListComponentState();
}

class _RankListComponentState extends State<RankListComponent> {
  bool favButtonSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        pushNewScreen(
            context,
            screen: ProductScreen(),
            withNavBar: true,
            pageTransitionAnimation: PageTransitionAnimation.fade
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 90,
        child: Row(
          children: [
            Text('${widget.index}', style: TextStyle(fontSize: 20),),
            Image.asset('assets/product.png'),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(0.0),
                child: IconButton(
                  padding: EdgeInsets.all(0.0),
                  icon: Icon(favButtonSelected ? Icons.favorite : Icons.favorite_border),
                  color: Colors.redAccent,
                  onPressed: () {
                    setState(() {
                      favButtonSelected ? favButtonSelected = false : favButtonSelected = true;
                    });
                  },
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Brand Name"),
                Text("Product Name", style: TextStyle(fontSize: 25),),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for( var i = 0 ; i < 5; i++ )
                          new IconTheme(
                            data: new IconThemeData(color: Colors.redAccent),
                            child: new Icon(Icons.star_rounded, size: 25,), // I want to iterate this "star icon" for reviews.ratings.length times
                          ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Text("4.8 Review(500)", style: TextStyle(fontSize: 15),)
                  ],
                ),
                Text("10kg / \$10.00", style: TextStyle(fontSize: 15),),
              ],
            )
          ],
        )
      ),
    );
  }
}
