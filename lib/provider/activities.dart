import 'package:flutter/material.dart';
import '../models/activity_model.dart';

class Activities with ChangeNotifier {
  final List<Activity> _activities = [
    Activity(
      id: '1',
      imageUrl: 'assets/images/stmarksbasilica.jpg',
      name: 'St. Mark\'s Basilica',
      type: 'Sightseeing Tour',
      startTimes: ['9:00 am', '11:00 am'],
      rating: 5,
      price: 30,
    ),
    Activity(
      id: '2',
      imageUrl: 'assets/images/gondola.jpg',
      name: 'Walking Tour and Gonadola Ride',
      type: 'Sightseeing Tour',
      startTimes: ['11:00 pm', '1:00 pm'],
      rating: 4,
      price: 210,
    ),
    Activity(
      id: '3',
      imageUrl: 'assets/images/murano.jpg',
      name: 'Murano and Burano Tour',
      type: 'Sightseeing Tour',
      startTimes: ['12:30 pm', '2:00 pm'],
      rating: 3,
      price: 125,
    ),
  ];

  List<Activity> get activities {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._activities];
  }

  List<Activity> get favoriteItems {
    return _activities.where((prodItem) => prodItem.isFavorite).toList();
  }

  Activity findById(String id) {
    return _activities.firstWhere((prod) => prod.id == id);
  }

}