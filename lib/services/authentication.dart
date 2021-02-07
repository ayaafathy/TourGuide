/// For Authentication with REST API

import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tour_guide/models/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication with ChangeNotifier {
  String _userID;
  String _email;
  String _token;
  DateTime _expiryDate;
  Timer _authenticationTimer;

  String get userID {
    return _userID;
  }

  String get email {
    return _email;
  }

  String get token {
    if (token != null &&
        _expiryDate != null &&
        _expiryDate.isAfter(DateTime.now())) {
      return _token;
    }
  }

  bool get isAuthenticated {
    return token != null;
  }

  Future<void> _authenticate(
      String action, String email, String password) async {
    /// Action: 'SignUp' OR 'signInWithPassword'
    final APIkey = 'AIzaSyDpUWCfMS_wtdKSaCP63XIJ3IEA5e8LOyY';
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$action?key=$APIkey';

    /// Response Payload(REST API)
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);

      /// Error response payload(REST API)
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      _userID = responseData['localId'];
      _email = responseData['email'];
      _token = responseData['idToken'];

      /// For debugging
      if (_userID == null) {
        throw HttpException('Null ID');
      }

      /// For debugging ///*****
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      print('Auth, User id is : $_userID');
      print('Auth, Token is : $_token');
      print('Auth, _expiryDate is : $_expiryDate');

      /// End of for debugging ///*****

      _autoSignOut();

      /// Provider
      notifyListeners();

      /// Shared Preferences, save data for auto sign in
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        'userID': _userID,
        'token': _token,
        'expiryDate': _expiryDate.toIso8601String(),

        /// Standard format: toIso8601String()
      });

      prefs.setString('TG_User', userData);
    } catch (error) {
      throw error; //***TODO: check this again
    }
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> signIn(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  Future<void> signOut() async {
    _userID = null;
    _email = null;
    _token = null;
    _expiryDate = null;
    _authenticationTimer?.cancel();
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  //***TODO: check this again
  Future<bool> _autoSignIn() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('TG_User')) {
      return false;
    }

    final savedUserData =
        json.decode(prefs.getString('TG_User')) as Map<String, dynamic>;
    _expiryDate = DateTime.parse(savedUserData['expiryDate']);

    /// For debugging ///*****
    if (_expiryDate.isBefore(DateTime.now())) {
      print('Expired');
      return false;
    }
    print("//Auto SignIn $savedUserData");

    /// End of for debugging ///*****

    try {
      _userID = savedUserData['userID'];
      _token = savedUserData['token'];
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
    }

    /// For debugging ///*****
    print('Test: $_token');
    print('_expiryDate: $_expiryDate');

    /// End of for debugging ///*****
    return true;
  }

  Future<void> _autoSignOut() {
    if (_authenticationTimer != null) {
      _authenticationTimer.cancel();
    }
    _authenticationTimer =
        Timer(_expiryDate.difference(DateTime.now()), signOut);
  }
}
