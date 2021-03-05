import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tour_guide/providers/destinations.dart';

import 'package:tour_guide/screens/map.dart';
import 'package:tour_guide/screens/settings_UI.dart';
import 'package:tour_guide/screens/user_profile.dart';

import 'package:tour_guide/widgets/drawer_UI.dart';
import 'package:tour_guide/widgets/appBar.dart';

// ignore: unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour_guide/widgets/destination_carousel.dart';
import 'package:tour_guide/widgets/hotel_carousel.dart';

// import 'dash_UI.dart';
// void main() => runApp(HomeScreen());

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            LocationsCarousel(),
          ],
        ),
      ),
    );
  }
}
