import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tour_guide/screens/signin_UI.dart';
/*
import 'package:tour_guide/screens/hotel_screen.dart';
import 'package:tour_guide/screens/signup_UI.dart';
import 'package:tour_guide/screens/settings_UI.dart';
import 'package:tour_guide/homepage.dart';
import 'package:tour_guide/screens/destination_screen.dart';
import 'package:tour_guide/screens/location_profile.dart';
import 'package:tour_guide/screens/savelist_UI.dart';
import 'package:tour_guide/screens/user_profile.dart';
import 'package:tour_guide/screens/startup_animation.dart';
import 'package:tour_guide/screens/map.dart';
*/
// import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/*
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
          '/loc': (context) => locProfile(),
          '/saved': (context) => MySavedList(),
          '/profile': (context) => UserProfile(),
          'hotel': (context) => Hotelscreen(),
          //'/search': (context) => Search(),
          '/map': (context) => Maps(),
        },
      ),
    );
*/
class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}

/*
class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return CircularProgressIndicator();
      //Something went wrong, put the indicator for now
      //Should show error message
    }
    if (!_initialized) {
      return CircularProgressIndicator();
      //Should show a loading indicator as flutterfire is intializing
    }
    return SignIn();
  }
}
*/
