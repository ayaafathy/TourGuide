import 'package:flutter/material.dart';
import 'package:tour_guide/screens/hotel_screen.dart';
import 'package:tour_guide/screens/signin_UI.dart';
import 'package:tour_guide/screens/signup_UI.dart';
import 'package:tour_guide/screens/settings_UI.dart';
import 'package:tour_guide/homepage.dart';
import 'package:tour_guide/screens/destination_screen.dart';
import 'package:tour_guide/screens/location_profile.dart';
import 'package:tour_guide/screens/savelist_UI.dart';
import 'package:tour_guide/screens/user_profile.dart';
import 'package:tour_guide/screens/search_UI2.dart';
import 'package:tour_guide/screens/startup_animation.dart';

// import 'package:tour_guide/screens/map.dart';

// import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() => runApp(
      MaterialApp(
        title: 'Named Routes',
        debugShowCheckedModeBanner: false,
        initialRoute: '/Start',
        routes: {
          '/Start': (context) => MyAnim(),
          '/signin': (context) => MyApp(),
          '/signup': (context) => SignUp(),
          '/settings': (context) => SettingsScreen(),
          '/home': (context) => HomeScreen(),
          '/dest': (context) => DestinationScreen(),
          '/loc': (context) => LocProfile(),
          '/saved': (context) => MySavedList(),
          '/profile': (context) => UserProfile(),
          'hotel': (context) => Hotelscreen(),
          '/search': (context) => Search(),
          // '/map': (context) => Map(),
        },
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
