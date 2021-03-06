import 'package:flutter/foundation.dart';

class Location {
  String index;
  String imageUrl = 'assets/images/genericLocation.jpg';
  String coverImageUrl = 'assets/images/genericLocationCover.jpg';
  String name;
  String shortInfo;
  String bio;
  String address;
  double price;
  var rating;
  bool isFavorite;

  Location({
    @required this.index,
    @required this.imageUrl,
    @required this.coverImageUrl,
    @required this.name,
    @required this.shortInfo,
    @required this.bio,
    @required this.address,
    this.price,
    this.rating,
    this.isFavorite = false,
  });

  void toggleFavoriteLocationStatus() {
    isFavorite = !isFavorite;
  }
}
