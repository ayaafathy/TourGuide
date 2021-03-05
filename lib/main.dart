import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tour_guide/providers/authentication.dart';
import 'package:tour_guide/providers/locations.dart';
import 'package:tour_guide/providers/activities.dart';
import 'package:tour_guide/providers/destinations.dart';

import 'package:tour_guide/screens/location_profile.dart';
import 'package:tour_guide/screens/savelist_UI.dart';
import 'package:tour_guide/screens/user_profile.dart';
import 'package:tour_guide/screens/homepage.dart';
import 'package:tour_guide/screens/map.dart';
import 'package:tour_guide/screens/destination_screen.dart';
import 'package:tour_guide/screens/auth_screens.dart';
import 'package:tour_guide/screens/hotel_screen.dart';
import 'package:tour_guide/screens/settings_UI.dart';
import 'package:tour_guide/screens/splash_screen.dart';
import 'package:tour_guide/screens/startup_animation.dart';

/// import 'package:tour_guide/services/push_notifications.dart';

void main() {
  runApp(
    /// To place Authentication at the top of the widget tree
    ChangeNotifierProvider(
      create: (context) => Authentication(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Authentication()),
        ChangeNotifierProvider(create: (context) => Locations()),
        ChangeNotifierProvider(create: (context) => Destinations()),
        ChangeNotifierProvider(create: (context) => Activities()),
      ],
      child: Consumer<Authentication>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '',
          routes: {
            '/Start': (context) => MyAnim(),
            '/auth': (context) => MyApp(),
            '/settings': (context) => SettingsScreen(),
            '/home': (context) => HomeScreen(),
            '/dest': (context) => DestinationScreen(),
            '/loc': (context) => locProfile(),
            '/saved': (context) => MySavedList(),
            '/profile': (context) => UserProfile(),
            'hotel': (context) => Hotelscreen(),
            //'/search': (context) => Search(),
            '/map': (context) => Maps(),
          },
          home: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/redstreet.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: //AuthScreen(),
                MyAnim(),
            //HomeScreen(),
          ),
        ),
      ),
    );
  }
}
