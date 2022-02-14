import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:new_project/screens/RankListScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
// ignore_for_file: prefer_const_constructors

class CategoryBar extends StatefulWidget {
  const CategoryBar({Key? key}) : super(key: key);

  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const <Widget>[
        CategoryItem(),
        CategoryItem(),
        CategoryItem(),
        CategoryItem(),
        CategoryItem(),
        CategoryItem(),
        CategoryItem(),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushNewScreen(
            context,
            screen: RankListScreen(),
            withNavBar: true,
            pageTransitionAnimation: PageTransitionAnimation.fade
        );
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        width: 70.0,
        height: 80.0,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffffc0c0),
          //boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 4, offset: Offset(2, 2))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              child: Image.asset('http://182.217.140.11:3000/api/file/imgDownload?dir=af2d6306f6762f6aecfd5a29b386df02', fit: BoxFit.fill),
            ),
            const Text('Category', style: TextStyle(),)
          ],
        ),
      ),
    );
  }
}
