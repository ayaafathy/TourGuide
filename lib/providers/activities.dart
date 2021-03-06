import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tour_guide/models/activity_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:tour_guide/providers/authentication.dart';

class Activities with ChangeNotifier {
  final List<Activity> _items = [
    Activity(
      id: '1',
      imageUrl: 'assets/images/stmarksbasilica.jpg',
      name: 'St. Mark\'s Basilica',
      city: 'Cairo',
      type: 'Sightseeing Tour',
      startTimes: ['9:00 am', '11:00 am'],
      rating: 5,
      price: 30,
    ),
    Activity(
      id: '2',
      imageUrl: 'assets/images/gondola.jpg',
      name: 'Walking Tour and Gonadola Ride',
      city: 'Alexandria',
      type: 'Sightseeing Tour',
      startTimes: ['11:00 pm', '1:00 pm'],
      rating: 4,
      price: 210,
    ),
    Activity(
      id: '3',
      imageUrl: 'assets/images/murano.jpg',
      name: 'Murano and Burano Tour',
      city: 'Luxor',
      type: 'Sightseeing Tour',
      startTimes: ['12:30 pm', '2:00 pm'],
      rating: 3,
      price: 125,
    ),
    Activity(
      id: '3',
      imageUrl: 'assets/images/murano.jpg',
      name: 'Murano and Burano Tour',
      city: 'Aswan',
      type: 'Sightseeing Tour',
      startTimes: ['12:30 pm', '2:00 pm'],
      rating: 3,
      price: 125,
    ),
  ];

  List<Activity> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  // List<Activity> get favoriteItems {
  //   return _items.where((prodItem) => prodItem.isFavorite).toList();
  // }

  // Activity findById(String id) {
  //   return _items.firstWhere((prod) => prod.id == id);
  // }
}
