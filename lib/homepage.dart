import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:tour_guide/widgets/drawer_UI.dart';
import 'package:tour_guide/widgets/appBar.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour_guide/widgets/destination_carousel.dart';
import 'package:tour_guide/widgets/hotel_carousel.dart';
//import 'dash_UI.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: unused_field
  int _selectedIndex = 0;
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: buildAppBar(Icons.menu, () {
        _scaffoldKey.currentState.openDrawer();
      }, 'Feed'),
      key: _scaffoldKey,
      drawer: DashNav(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            /*Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 120),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),*/
            SizedBox(
              height: 20.0,
            ),
            DestinationCarousel(),
            SizedBox(
              height: 20.0,
            ),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            // ignore: deprecated_member_use
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.public,
              size: 30,
            ),
            // ignore: deprecated_member_use
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: AssetImage('assets/images/marc.jpg'),
            ),
            // ignore: deprecated_member_use
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
