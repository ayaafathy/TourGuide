import 'package:flutter/material.dart';
import 'package:tour_guide/dash_UI.dart';
import 'package:tour_guide/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        constraints: BoxConstraints.expand(),
        child: Scaffold(
          appBar: AppBar(title: Text('News Feed',style: TextStyle(color: Colors.black,),),),
          key: _scaffoldKey,
          drawer: DashNav(),
          body: SafeArea(
            child: HomeScreen(),
          ),



        ),

      ),

    );

  }
}
