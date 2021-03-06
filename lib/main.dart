import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:tour_guide/models/t_guide_model.dart';
import 'package:tour_guide/providers/authentication.dart';
import 'package:tour_guide/providers/t_guides.dart';
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
import 'package:tour_guide/screens/location_screen.dart';
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
        ChangeNotifierProxyProvider<Authentication, Guides>(
          create: (_) => Guides(
            [],
            Provider.of<Authentication>(context, listen: true).token,
            Provider.of<Authentication>(context, listen: true).userID,
          ),
          update: (ctx, auth, guidesList) =>
              guidesList..receiveToken(auth, guidesList.guides),
        ),
        ChangeNotifierProxyProvider<Authentication, Locations>(
          create: (_) => Locations(Provider.of<Authentication>(context, listen: true).token,
            Provider.of<Authentication>(context, listen: true).userID,
            [],

          ),
          update: (ctx, auth, locList) =>
          locList..receiveToken(auth, locList.locationsList),
        ),


        //ChangeNotifierProvider(create: (context) => Authentication()),
        //ChangeNotifierProvider(create: (context) => Guides()),
        //ChangeNotifierProvider(create: (context) => Locations()),
        ChangeNotifierProvider(create: (context) => Destinations()),
        ChangeNotifierProvider(create: (context) => Activities()),
      ],
      child: Consumer<Authentication>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '',
          routes: {
            '/Start': (context) => MyAnim(),
            '/auth': (context) => AuthScreen(),
            '/home': (context) => HomeScreen(),
            '/settings': (context) => SettingsScreen(),
            '/dest': (context) => DestinationScreen(),
            '/loc': (context) => locProfile(),
            '/saved': (context) => MySavedList(),
            '/profile': (context) => UserProfile(),
            'location': (context) => LocationScreen(),
            // '/search': (context) => Search(),
           // '/map': (context) => Maps(),
          },

          /// TODO: Should navigate to HomeScreen() if user is authenticated and to MyAnim() if user isn't
          home: auth.isAuth
              ? HomeScreen()
              : FutureBuilder(
                  future: auth.autoSignIn(),
                  builder: (ctx, autResSnapshot) =>
                      autResSnapshot.connectionState == ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen(),
                ),
          //MyAnim(),
        ),
      ),
    );
  }
}
