import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/destination_model.dart';
import '../models/activity_model.dart';
import 'package:tour_guide/provider/activities.dart';

class Destinations with ChangeNotifier {
  static String dummyDesc =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";



  final List<Destination> _items = [
    Destination(
      id: '1',
      imageUrl: 'assets/images/venice.jpg',
      city: 'Venice',
      country: 'Italy',
      description: 'Visit Venice for an amazing and unforgettable adventure.',
      //activities: act
    ),
    Destination(
      id: '2',
      imageUrl: 'assets/images/paris.jpg',
      city: 'Paris',
      country: 'France',
      description: 'Visit Paris for an amazing and unforgettable adventure.',
      //activities: activities,
    ),
    Destination(
      id: '3',
      imageUrl: 'assets/images/newdelhi.jpg',
      city: 'New Delhi',
      country: 'India',
      description: 'Visit New Delhi for an amazing and unforgettable adventure.',
      //activities: activities,
    ),
    Destination(
      id: '4',
      imageUrl: 'assets/images/saopaulo.jpg',
      city: 'Sao Paulo',
      country: 'Brazil',
      description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
      //activities: activities,
    ),
    Destination(
      id: '5',
      imageUrl: 'assets/images/newyork.jpg',
      city: 'New York City',
      country: 'United States',
      description: 'Visit New York for an amazing and unforgettable adventure.',
      //activities: activities,
    ),
  ];

  List<Destination> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Destination> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Destination findById(int id) {
    return _items.firstWhere((prod) => prod.id == id.toString());
  }

}