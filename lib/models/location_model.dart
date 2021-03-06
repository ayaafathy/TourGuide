import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Location with ChangeNotifier {
  String index;
  String imageUrl; //= 'assets/images/genericLocation.jpg';
  String coverImageUrl;// = 'assets/images/genericLocationCover.jpg';
  String name;
  String shortInfo;
  String bio;
  String address;
  int price;
  var rating;
  bool isFavorite;

  Location({
    this.index,
    this.imageUrl,
     this.coverImageUrl,
     this.name,
     this.shortInfo,
     this.bio,
     this.address,
    this.price,
    this.rating,
    this.isFavorite = false,
  });

  void toggleFavoriteLocationStatus() {
    isFavorite = !isFavorite;
  }
}

