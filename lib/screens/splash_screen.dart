import 'package:flutter/material.dart';
import 'package:tour_guide/providers/locations.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loc = Provider.of<Locations>(context).fetchAndSetLocations();
    print(loc);
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
