import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:new_project/MainPage.dart';
import 'package:new_project/screens/ProductScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';

class RankSlideBar extends StatefulWidget {

  @override
  _RankSlideBarState createState() => _RankSlideBarState();
}

class _RankSlideBarState extends State<RankSlideBar> {
  final PageController ctrl = PageController(viewportFraction: 0.8);
  // final Firestore db = Firestore.instance;
  // Stream slides;

  int currentPage = 0;

  @override
  void initState() {
    // _queryDb();

    ctrl.addListener(() {
      int next = ctrl.page!.round();

      if(currentPage != next){
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MainPageState? parent = context.findAncestorStateOfType<MainPageState>();
    return InkWell(
      onTap: () {
        pushNewScreen(
            context,
            screen: ProductScreen(),
          withNavBar: true,
          pageTransitionAnimation: PageTransitionAnimation.fade
        );
      },
      child: Scaffold(
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 240,
                child: PageView.builder(
                  controller: ctrl,
                  itemCount : 5,
                  itemBuilder: (context, int currentIdx) {
                    bool active = currentIdx == currentPage;
                    return _buildStoryPage(active);
                  },
                ),
              ),

              SmoothPageIndicator(
                controller: ctrl,
                count: 5,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  type: WormType.thin,
                  activeDotColor: Colors.brown,
                  dotColor: Colors.black12
                  // strokeWidth: 5,
                ),
              ),
            ]

          )
      ),
    );
  }

  // Stream _queryDb({ String tag = 'favorite' }){
  //   Query query = db.collection('stories').where('tags', arrayContains: tag);
  //
  //   slides = query.snapshots().map((list) => list.documents.map((doc) => doc.data));
  //
  //   setState(() {
  //     activeTag = tag;
  //   });
  // }

  _buildStoryPage(bool active) {
    final double blur = active ? 10 : 0;
    final double offset = active ? 10 : 0;
    final double top = active ? 10 : 40;
    final double bottom = active ? 20 : 40;
    final bool visible = active ? true : false;
    final double sigmaVal = active ? 0.0 : 2.0;

    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: bottom, left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: new AssetImage('assets/dogPicture2.jpg'),
        ),
        boxShadow:  [BoxShadow(color: Colors.black87, blurRadius: blur, offset: Offset(offset, offset))],

      ),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Visibility(
              child: Text('X. Brand Name', style: TextStyle(fontSize: 20, color: Colors.black45)),
              visible: visible,
            ),
            Visibility(
              child: Text('Product Name', style: TextStyle(fontSize: 30, color: Colors.black)),
              visible: visible,
            ),
          ]
        )
      ),
    );
  }
}

