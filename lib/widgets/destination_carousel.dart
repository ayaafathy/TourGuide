//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tour_guide/models/destination_model.dart';
import 'package:tour_guide/providers/destinations.dart';
import 'package:tour_guide/screens/destination_screen.dart';
import 'package:provider/provider.dart';
import 'package:tour_guide/providers/activities.dart';

class DestinationCarousel extends StatefulWidget {
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  @override
  Widget build(BuildContext context) {
    final destination = Provider.of<Destinations>(context);

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Cities',
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destination.items.length,
              itemBuilder: (BuildContext context, int index) {
                var des = destination.items[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChangeNotifierProvider<Activities>(
                                create: (_) => Activities(),
                                child: DestinationScreen(
                                  destination: des,
                                ),
                              ))),
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    width: 210.0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 15.0,
                          child: Container(
                            height: 120.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    ' activities', //-------------------->>>>>>>>>>na2sa list var activity
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2),
                                  ),
                                  Text(
                                    des.description,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
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
                                  image: AssetImage(des.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 10.0,
                                bottom: 10.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      des.city,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2),
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        des.isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                      ),
                                      color: Colors.red,
                                      onPressed: () {
                                        setState(() {
                                          des.toggleFavoriteStatus();
                                        });
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
                                          des.country,
                                          style: TextStyle(color: Colors.white),
                                        ),
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
            ))
      ],
    );
  }
}
