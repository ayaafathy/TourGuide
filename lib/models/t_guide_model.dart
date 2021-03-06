import 'package:flutter/foundation.dart';

class Guide with ChangeNotifier {
  final String id;
  final String imageUrl;
  final String name;
  final int age;
  final int phonenumber;
  final int price;
  final int rating;

  Guide({
    this.id,
    this.imageUrl,
    this.name,
    this.age,
    this.phonenumber,
    this.price,
    this.rating,
  });
}
