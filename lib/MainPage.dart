import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/drawer/MyInfoDrawer.dart';
import 'package:new_project/screens/CommunityPage.dart';

import 'package:new_project/screens/HomeScreen.dart';
import 'package:new_project/screens/RankListScreen.dart';
import 'package:new_project/screens/category/cate_shop3.dart';
import 'package:new_project/screens/recommend/RecommendHome.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'components/RankTab2.dart';

// ignore_for_file: prefer_const_constructors

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}

class MainPageState extends State<MainPage>{
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  int _selectedIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        label: 'home',
        icon: Icon(Icons.home)
    ),
    BottomNavigationBarItem(
        label: 'recommend',
        icon: Icon(Icons.pets)
    ),
    BottomNavigationBarItem(
        label: 'service',
        icon: Image.asset('assets/cate/service5')
    ),
    BottomNavigationBarItem(
        label: 'community',
        icon: Icon(Icons.article)
    ),
  ];

  List<Widget> _buildScreens() {
    return [
      HomeScreen(key: homeScreenKey),
       RankTab2(),
      cate_shop3(),
      CommunityPage()

    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.paw),
        title: ("Recommend"),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.suit_heart),
        title: ("Service"),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.text_bubble),
        title: ("Community"),
        activeColorPrimary: CupertinoColors.destructiveRed,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Container(
            padding: EdgeInsets.all(0),
            child: Image.asset('assets/logogo.png',height: 30,width: 120,)
          ),
          actions: <Widget> [
            IconButton(
              iconSize: 30,
              icon: Icon(Icons.search),
                color: Color(0xff2c3440),
                onPressed: () {},
            ),
            IconButton(
              iconSize: 30,
              icon: Icon(Icons.account_circle),
              color: Color(0xff2c3440),
              onPressed: () {
                _key.currentState!.openEndDrawer();
              },
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
      ),
      endDrawer: MyInfoDrawer(),

      body: Container(
        child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style9, // Choose the nav bar style with this property.
    ),
      ),
    );
  }
}