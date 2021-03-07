import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:tour_guide/models/t_guide_model.dart';
import 'package:tour_guide/providers/authentication.dart';

class Guides with ChangeNotifier {
  static const baseUrl = 'https://tourguide-422-default-rtdb.firebaseio.com';

  List<Guide> _guides = [];
  String authToken;
  String userID;

  Guides(this._guides, this.authToken, this.userID);
  //Guides();

  List<Guide> get guides {
    return [..._guides];
  }

  Future<void> fetchAndSetGuides() async {
    var url = '$baseUrl/tourguide.json';

    try {
      final response = await http.get(url);
      final resData = json.decode(response.body) as Map<dynamic, dynamic>;
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
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  void receiveToken(Authentication auth, List<Guide> guides) {
    authToken = auth.token;
    userID = auth.userID;
    print('Guides receiveToken, userId: $userID');
    print('Guides receiveToken, token: $authToken');
    _guides = guides;
  }
}
