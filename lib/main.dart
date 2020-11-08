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
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.indigo[300],
                size: 35,
              ),
              tooltip: 'Drawer',
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.indigo[300],
              ),
            ),
            centerTitle: true,
          ),
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
