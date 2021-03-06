import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:tour_guide/models/http_exception.dart';
import 'package:tour_guide/models/t_guide_model.dart';
import 'package:tour_guide/providers/authentication.dart';

class Guides with ChangeNotifier {
  static const baseUrl =
      'https://tourguide-422-default-rtdb.firebaseio.com/tourguide';
  List<Guide> _guides = [];
  String authToken;
  String userID;

  Guides(this._guides, this.authToken, this.userID);

  List<Guide> get guides {
    return [..._guides];
  }

  Future<void> fetchAndSetGuides() async {
    var url = '$baseUrl/tourguide.json?auth=$authToken';
    try {
      final response = await http.get(url);

      final resData = json.decode(response.body) as Map<String, dynamic>;
      if (resData == null) {
        return;
      }
      final List<Guide> tgData = [];
      resData.forEach((key, data) {
        tgData.add(Guide(
          id: key,
          imageUrl: data['imageUrl'],
          name: data['name'],
          age: data['age'],
          phonenumber: data['phonenumber'],
          price: data['price'],
          rating: data['rating'],
        ));
      });

      _guides = tgData;
      notifyListeners();

      /// For debugging
      print('Tour Guides: **********************************************');
      print('/////Testing Tour Guides: ');
      print('Response statusCode: ');
      print(response.statusCode);
      print('Response Body: ');
      print(response.body);
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  void receiveToken(Authentication auth, List<Guide> guides) {
    authToken = auth.token;
    userID = auth.userID;
    print('Guides receiveToken, userId: $userID');
    _guides = guides;
  }
}

/*
  final List<Guide> guides = [
    Guide(
      imageUrl: 'assets/images/guide0.jpg',
      name: 'merlien',
      age: 25,
      phonenumber: '01019736549',
      price: 175,
      rating: 3,
    ),
    Guide(
      imageUrl: 'assets/images/guide1.jpg',
      name: 'andro jr.',
      age: 25,
      phonenumber: '01019765912',
      price: 300,
      rating: 4,
    ),
    Guide(
      imageUrl: 'assets/images/guide2.jpg',
      name: 'samantha jack',
      age: 25,
      phonenumber: '01013927849',
      price: 240,
      rating: 5,
    ),
    Guide(
      imageUrl: 'assets/images/marc.jpg',
      name: 'arron white',
      age: 25,
      phonenumber: '01011727849',
      price: 190,
      rating: 3,
    ),
    Guide(
      imageUrl: 'assets/images/omar.jpg',
      name: 'miley blake',
      age: 25,
      phonenumber: '01013207849',
      price: 140,
      rating: 2,
    ),
  ];
  */
