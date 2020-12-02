import 'package:flutter/material.dart';
import 'package:tour_guide/screens/signin_UI.dart';
import 'package:tour_guide/screens/signup_UI.dart';
import 'package:tour_guide/screens/settings_UI.dart';
import 'package:tour_guide/homepage.dart';
import 'package:tour_guide/screens/destination_screen.dart';
import 'package:tour_guide/screens/location_profile.dart';
import 'package:tour_guide/screens/savelist_UI.dart';
import 'package:tour_guide/screens/user_profile.dart';

void main() => runApp(
      MaterialApp(
        title: 'Named Routes',
        debugShowCheckedModeBanner: false,
        initialRoute: '/signin',
        routes: {
          '/signin': (context) => MyApp(),
          '/signup': (context) => SignUp(),
          '/settings': (context) => SettingsScreen(),
          '/home': (context) => HomeScreen(),
          '/dest': (context) => DestinationScreen(),
          '/loc': (context) => LocProfile(),
          '/saved': (context) => MySavedList(),
          '/profile': (context) => UserProfile(),
        },
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
