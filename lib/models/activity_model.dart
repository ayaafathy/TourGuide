import 'package:flutter/foundation.dart';

class Activity with ChangeNotifier {
  final String id;
  String imageUrl;
  String name;
  String type;
  List<String> startTimes;
  int rating;
  int price;
  bool isFavorite;

  Activity({
    @required this.id,
    this.imageUrl,
    this.name,
    this.type,
    this.startTimes,
    this.rating,
    this.price,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
