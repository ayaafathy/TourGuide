import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tour_guide/providers/locations.dart';
import 'package:tour_guide/screens/location_profile.dart';

import 'package:tour_guide/screens/location_screen.dart';

import 'package:tour_guide/models/location_model.dart';

class LocationsCarousel extends StatefulWidget {
  @override
  _LocationsCarouselState createState() => _LocationsCarouselState();
}

class _LocationsCarouselState extends State<LocationsCarousel> {
  var location;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    location = Provider.of<Locations>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Touristic places',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Colors.lightBlue[400],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: FutureBuilder(
              future: location.fetchAndSetLocations(),
              builder: (context, AsyncSnapshot<void> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    print(location.locationsList.length);
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: location.locationsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        //Location loc = location.locationsList[index];

                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      ChangeNotifierProvider<Locations>(
                                        create: (_) => Locations.fromLoc(),
                                        child: LocationScreen(
                                          location:
                                              location.locationsList[index],
                                        ),
                                      ))),
                          child: Container(
                            margin: EdgeInsets.all(10.0),
                            width: 200.0,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: <Widget>[
                                Positioned(
                                  bottom: 15.0,
                                  child: Container(
                                    height: 150.0,
                                    width: 250.0,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            location.locationsList[index].name,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1.2),
                                          ),
                                          SizedBox(
                                            height: 2.0,
                                          ),
                                          Text(
                                            location
                                                .locationsList[index].address,
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          SizedBox(
                                            height: 2.0,
                                          ),
                                          Text(
                                            '\$${location.locationsList[index].price}',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: Image(
                                          height: 180.0,
                                          width: 220.0,
                                          image: NetworkImage(location
                                              .locationsList[index].imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        left: 10.0,
                                        bottom: 10.0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(
                                                location.locationsList[index]
                                                        .isFavorite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                              ),
                                              color: Colors.red,
                                              onPressed: () {
                                                setState(() {
                                                  location.locationsList[index]
                                                      .toggleFavoriteLocationStatus();
                                                });
                                              },
                                            ),
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  FontAwesomeIcons
                                                      .locationArrow,
                                                  size: 10.0,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                // Text(
                                                //   des.country,
                                                //   style: TextStyle(color: Colors.white),
                                                // ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text('No Data'),
                    );
                  }
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ],
    );
  }
}
