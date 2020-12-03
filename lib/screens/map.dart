import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tour_guide/widgets/appBar.dart';
import 'package:tour_guide/widgets/drawer_UI.dart';

void main() => runApp(Map());

class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Maps(),
    );
  }
}

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  List<Marker> allMarkers = [];

  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.04444, 31.357),
    zoom: 10.5,
  );

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: buildAppBar(Icons.menu, () {
        _scaffoldKey.currentState.openDrawer();
      }, 'Maps'),
      key: _scaffoldKey,
      drawer: DashNav(),
      body: ListView(children: [
        Container(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            width: 200,
            height: 500),
      ]),
    );
  }

  // void mapCreated(controller) {
  //   setState(() {
  //     _controller = controller;
  //   });
  // }

}
