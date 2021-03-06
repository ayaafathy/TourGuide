// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:tour_guide/widgets/appBar.dart';
// import 'package:tour_guide/widgets/drawer_UI.dart';
// import 'package:tour_guide/src/locations.dart' as locations;
//
// void main() => runApp(Maps());
//
// class Maps extends StatefulWidget {
//   @override
//   _MapsState createState() => _MapsState();
// }
//
// class _MapsState extends State<Maps> {
//   final Map<String, Marker> _markers = {};
//   Future<void> _onMapCreated(GoogleMapController controller) async {
//     final googleTours = await locations.getGoogleTours();
//     setState(() {
//       _markers.clear();
//       for (final tour in googleTours.tours) {
//         final marker = Marker(
//           markerId: MarkerId(tour.name),
//           position: LatLng(tour.lat, tour.lng),
//           infoWindow: InfoWindow(
//             title: tour.name,
//             snippet: tour.address,
//           ),
//         );
//         _markers[tour.name] = marker;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     /// Removed excess MaterialApp
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Map'),
//         backgroundColor: Colors.green[700],
//       ),
//       body: GoogleMap(
//         onMapCreated: _onMapCreated,
//         initialCameraPosition: CameraPosition(
//           target: const LatLng(29.8025, 29.8206),
//           zoom: 5.3,
//         ),
//         markers: _markers.values.toSet(),
//       ),
//     );
//   }
// }
