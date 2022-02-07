import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/LandingPage.dart';
// ignore_for_file: prefer_const_constructors

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'LondrinaSolid'),
      home: LandingPage(),
    );
  }
}


