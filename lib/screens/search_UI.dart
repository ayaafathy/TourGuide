import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:tour_guide/models/location_model.dart';


void main() => runApp(SearchApp());

class SearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'search_page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final Location loc = locations[index];
          return ListTile(
            title: Text(loc.name),
            subtitle: Text(loc.shortInfo),
            trailing: Text('${loc.rating} stars'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Search Locations',
        onPressed: () => showSearch(
          context: context,
          delegate: SearchPage<Location>(
            items: locations,
            searchLabel: 'Search Locations',
            suggestion: Center(
              child: Text('Lookup your desired location'),
            ),
            failure: Center(
              child: Text('No location found found :('),
            ),
            filter: (locations) => [
              locations.name,
              locations.shortInfo,
              locations.rating.toString(),
            ],
            builder: (locations) => ListTile(
              title: Text(locations.name),
              subtitle: Text(locations.shortInfo),
              trailing: Text('${locations.rating} stars'),
            ),
          ),
        ),
        child: Icon(Icons.search),
      ),
    );
  }
}