import 'package:flutter/material.dart';
import 'package:tour_guide/dash_UI.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: DashNav(),
    );
  }
}
