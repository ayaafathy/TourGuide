import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_guide/provider/destinations.dart';
import 'package:tour_guide/screens/map.dart';
import 'package:tour_guide/widgets/drawer_UI.dart';
import 'package:tour_guide/widgets/appBar.dart';
// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour_guide/widgets/destination_carousel.dart';
import 'package:tour_guide/widgets/hotel_carousel.dart';

// import 'dash_UI.dart';
// void main() => runApp(HomeScreen());

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
            SizedBox(
              height: 20.0,
            ),
            DestinationCarousel(),
            // ChangeNotifierProvider<Destinations>(
            //   create: (_)=> Destinations(),
            //   child: DestinationCarousel(
            //
            //   ),
            // ),
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
          // BottomNavigationBarItem(
          //   IconButton(
          //     icon: Icon(Icons.public),
          //     onPressed: () {
          //       Navigator.push(
          //           context, MaterialPageRoute(builder: (context) => Maps()));
          //     },
          //   ),
          //   // ignore: deprecated_member_use
          //   title: SizedBox.shrink(),
          // ),
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
