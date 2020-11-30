import 'package:flutter/material.dart';
import 'package:tour_guide/widgets/dash_UI.dart';
import 'package:tour_guide/homepage.dart';
import 'package:tour_guide/widgets/appBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //remove container and put scaffold directly
      //put material in runapp and return scaffold instead
      home: Container(
        constraints: BoxConstraints.expand(),
        child: Scaffold(
          appBar: buildAppBar(() {
            _scaffoldKey.currentState.openDrawer();
          }, 'Feed'),
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
