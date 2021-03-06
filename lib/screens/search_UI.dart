import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';
import 'package:tour_guide/models/location_model.dart';
import 'package:tour_guide/main.dart';
import 'package:tour_guide/providers/locations.dart';
import 'package:tour_guide/screens/location_profile.dart';
import 'dart:core';

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

void main() => runApp(SearchApp());

class SearchApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /// Removed excess MaterialApp
    return MyHomePage();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locationlist = Provider.of<Locations>(context);

    return Scaffold(
      body: FutureBuilder<Object>(
        future: locationlist.fetchAndSetLocations(),
    builder: (context, snapshot) {
    /// Circular Indicator if loading
    return
    /*
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : */
    Column(
    children: <Widget>[
    Stack(
    children: <Widget>[
    Padding(
    padding: EdgeInsets.symmetric(
    horizontal: 10.0,
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[],
    ),
    ),
    ],
    ),
    Expanded(
    child: ListView.builder(
        itemCount: locationlist.locationsList.length,
        itemBuilder: (context, index) {
          final Location loc = locationlist.locationsList[index];
          return ListTile(
            title: Text(loc.name),
            subtitle: Text(loc.shortInfo),
            onTap: () {
              Navigator.pushNamed(context, '/loc',
                  arguments: locProfile.custom(index));
            },
            trailing: Text('${loc.rating} stars'),
          );
        },
      ),
      /*floatingActionButton: FloatingActionButton(
        tooltip: 'Search Locations',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<Location>(
            items: location.locationsList,
            searchLabel: 'Search Locations',
            suggestion: Center(
              child: Text('Lookup your desired location'),
            ),
            failure: Center(
              child: Text('No location found'),
            ),
            filter: (loc) => [loc.name, loc.shortInfo, loc.rating.toString()],
            builder: (locations) => ListTile(
                title: Text(locations.name),
                subtitle: Text(locations.shortInfo),
                onTap: () {
                  int index = location.locationsList.indexWhere(
                      (searchLocation) =>
                          searchLocation.name == locations.name);
                  Navigator.pushNamed(context, '/loc',
                      arguments: locProfile.custom(index));
                },
                trailing: Text('${locations.rating} stars')),
          ),
        ),
        child: Icon(Icons.search),
      ),*/
    ),
    ],
    );
  },
    ));
}
}
