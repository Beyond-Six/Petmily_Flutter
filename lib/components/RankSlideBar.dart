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
  late Timer _timer;

  @override
  void initState() {
    // _queryDb();
    super.initState();
    ctrl.addListener(() {
      int next = ctrl.page!.round();

      if(currentPage != next){
        setState(() {
          currentPage = next;
        });
      }
    });

    _timer = Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (currentPage < 4) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      ctrl.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    MainPageState? parent = context.findAncestorStateOfType<MainPageState>();
    return InkWell(
      // onTap: () {
      //   pushNewScreen(
      //       context,
      //       screen: ProductScreen(),
      //     withNavBar: true,
      //     pageTransitionAnimation: PageTransitionAnimation.fade
      //   );
      // },
      child: Scaffold(
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 230,
                child: PageView.builder(
                  controller: ctrl,
                  itemCount : 5,
                  itemBuilder: (context, int currentIdx) {
                    bool active = currentIdx == currentPage;
                    return _buildStoryPage(active, currentIdx);
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
                  activeDotColor: Color(0xff2c3440),
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

  _buildStoryPage(bool active, int idx) {
    final double blur = active ? 10 : 0;
    final double offset = active ? 10 : 0;
    final double top = active ? 10 : 40;
    final double bottom = active ? 20 : 40;
    final bool visible = active ? true : false;
    final double sigmaVal = active ? 0.0 : 2.0;

    List<String> mainTitle = [
      "Silicone pet brush",
      "Best Cat Trees",
      "Agility Contest Final",
      "Open New Hotel",
      "Armored Skink"
    ];

    List<String> subTitle = [
      "Soft without irritation",
      "Safe and Stable",
      "Exceeding expectations",
      "SiSiPu's splendid",
      "How To Train Your Dragon"
    ];

    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: bottom, left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: new AssetImage('assets/image/mainBanner/weeklyFeatured' + idx.toString() + '.jpg'),
        ),
        boxShadow:  [BoxShadow(color: Colors.black54, blurRadius: blur, offset: Offset(offset, offset))],

      ),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Visibility(
              child: Container(
                child: Text(subTitle[idx], style: TextStyle(fontSize: 20, color: Colors.white70, height: 1.4)),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 20, offset: Offset(0, 0))]
                ),
              ),
              visible: visible,
            ),
            Visibility(
              child: Container(
                child: Text(mainTitle[idx], style: TextStyle(fontSize: 30, color: Colors.white, height: 1.4)),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 20, offset: Offset(0, 0))]
                ),
              ),
              visible: visible,
            ),
          ]
        )
      ),
    );
  }
}

