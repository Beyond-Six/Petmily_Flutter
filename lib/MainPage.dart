import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:new_project/screens/HomeScreen.dart';
import 'package:new_project/screens/RankListScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

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
        label: 'community',
        icon: Icon(Icons.article)
    ),
  ];

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      Text('recommendation page'),
      Text('community page'),
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Row(
            children: [
              Icon(Icons.home_rounded, color: Colors.redAccent),
              Text('PETMILY', style: TextStyle(fontSize: 25,  color: Colors.redAccent),)
            ],
          ),
          actions: <Widget> [
            IconButton(
              icon: Icon(Icons.search),
                color: Colors.brown,
                onPressed: () {},
            )
          ],
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0.0,
        ),
      ),
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