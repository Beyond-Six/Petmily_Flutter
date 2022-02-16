import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/MainPage.dart';
// ignore_for_file: prefer_const_constructors

class LandingPage extends StatefulWidget {

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), (){
      Get.off(() => MainPage());
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("PET", style: TextStyle(fontSize: 80, color: Colors.redAccent, fontWeight: FontWeight.w500, height: 1)),
            Text("IS", style: TextStyle(fontSize: 80, color: Colors.redAccent, fontWeight: FontWeight.w500, height: 1)),
            Text("FAMILY", style: TextStyle(fontSize: 80, color: Colors.redAccent, fontWeight: FontWeight.w500, height: 1))
          ]
      ),
      ),
    );
  }
}
