import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_guide/providers/authentication.dart';
import 'package:tour_guide/screens/auth_screens.dart';
import 'package:tour_guide/screens/hotel_screen.dart';
import 'package:tour_guide/screens/settings_UI.dart';
import 'package:tour_guide/homepage.dart';
import 'package:tour_guide/screens/destination_screen.dart';
import 'package:tour_guide/screens/location_profile.dart';
import 'package:tour_guide/screens/savelist_UI.dart';
import 'package:tour_guide/screens/user_profile.dart';
import 'package:tour_guide/screens/startup_animation.dart';
import 'package:tour_guide/screens/map.dart';
import 'package:flutter_launcher_icons/android.dart';

/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
*/

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
    /// TODO: Use this when state managements in other models is done
    /// TODO: savedLocations model,  method
    /*
    return MultiProvider(
      providers: [
        ChangeNotifierProxyProvider<Authentication, savedLocations>(
          create: (_) => savedLocations(
              Provider.of<Authentication>(context, listen: true).token,
              Provider.of<Authentication>(context, listen: true)._userID, []),
          update: (ctx, Authentication, savedLocations) =>
              savedLocations..receiveToken(Authentication, savedLocations.items),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
     
      ],
      child: Consumer<Authentication>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: '',
          initialRoute: '/Start',
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
            child: auth.isAuthenticated
                ? HomeScreen()
                : FutureBuilder(
                    future: auth.autoSignIn(),
                    builder: (ctx, autResSnapshot) =>
                        autResSnapshot.connectionState ==
                                ConnectionState.waiting
                            ? MyAnim()
                            : AuthScreen(),
                  ),
             
          ),
        ),
      ),
    );
    */

    return MaterialApp(
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
        child: // HomeScreen(),
            AuthScreen(),
      ),
    );
  }
}
