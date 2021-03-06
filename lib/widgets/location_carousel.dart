import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:tour_guide/providers/locations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour_guide/screens/location_screen.dart';
import 'package:tour_guide/models/location_model.dart';

class LocationsCarousel extends StatefulWidget {
  @override
  _LocationsCarouselState createState() => _LocationsCarouselState();
}

class _LocationsCarouselState extends State<LocationsCarousel> {
  @override
  Widget build(BuildContext context) {
    final location = Provider.of<Locations>(context);
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
              /*
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
              ),
              */
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: location.locationsList.length,
            itemBuilder: (BuildContext context, int index) {
              var loc = location.locationsList[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider<Locations>(
                              create: (_) => Locations(),
                              child: LocationScreen(
                                location: loc,
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
                          height: 120.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  loc.name,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2),
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                /*
                                Text(
                                  loc.address,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                */
                                Text(
                                  '\$${loc.price}',
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
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                height: 180.0,
                                width: 180.0,
                                image: AssetImage(loc.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      loc.isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                    ),
                                    color: Colors.red,
                                    onPressed: () {
                                      /*
                                        setState(() {
                                          //loc.toggleFavoriteStatus();
                                        
                                        });
                                        */
                                    },
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.locationArrow,
                                        size: 10.0,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        '', //loc.city
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
