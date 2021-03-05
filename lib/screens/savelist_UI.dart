import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tour_guide/widgets/fav_widget.dart';
import 'package:tour_guide/providers/destinations.dart';
import 'package:tour_guide/widgets/appBar.dart';
/*
void main()
{
  runApp(MySavedList());
}*/

class MySavedList extends StatefulWidget {
  @override
  _MySavedListState createState() => _MySavedListState();
}

class _MySavedListState extends State<MySavedList> {
  @override
  Widget build(BuildContext context) {
    final destinations = Provider.of<Destinations>(context).favoriteItems;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourite Screen'),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: destinations.length,
                itemBuilder: (ctx, i) => FavWidget(
                  destination: destinations[i],
                ),
              ),
            )
          ],
        ));
  }
}
