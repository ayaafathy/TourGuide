import 'package:flutter/material.dart';

import 'package:tour_guide/models/destination_model.dart';
import 'package:tour_guide/models/activity_model.dart';

import 'package:provider/provider.dart';
import 'package:tour_guide/providers/activities.dart';

class Destinations with ChangeNotifier {
  static String dummyDesc =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
  //final deeb = Provider.of<Activities>(context);

  final List<Destination> _items = [
    Destination(
        id: '1',
        imageUrl: 'assets/images/Cairo.jpg',
        city: 'Cairo',
        description: 'Visit Venice for an amazing and unforgettable adventure.',
        activities: []),
    Destination(
      id: '2',
      imageUrl: 'assets/images/Alexandria.jpg',
      city: 'Alexandria',
      description: 'Visit Paris for an amazing and unforgettable adventure.',
      activities: [],
    ),
    Destination(
      id: '3',
      imageUrl: 'assets/images/Luxor.jpg',
      city: 'Luxor',
      description:
          'Visit New Delhi for an amazing and unforgettable adventure.',
      activities: [],
    ),
    Destination(
      id: '4',
      imageUrl: 'assets/images/Aswan.jpg',
      city: 'Aswan',
      description:
          'Visit Sao Paulo for an amazing and unforgettable adventure.',
      activities: [],
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

  Destination findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // List<Activity> getProductsById(BuildContext context, String id) {
  //   List<Activity> list = [];
  //   for (Activity activityid
  //       in _items.firstWhere((cat) => cat.id == id).activities) {
  //     list.add(Provider.of<Activities>(context).findById(activityid.id));
  //   }
  //   return list;
  // }
}
