import 'package:tour_guide/models/activity_model.dart';
import 'package:flutter/foundation.dart';


class Destination with ChangeNotifier {
  final String id;
  final String imageUrl;
  final String city;
  final String country;
  final String description;
  List<Activity> activities;
  bool isFavorite;

  Destination({
    @required this.id,
    @required this.imageUrl,
    @required this.city,
    @required this.country,
    @required this.description,
    this.activities,
    this.isFavorite = false,

  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}




