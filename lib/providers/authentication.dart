/// For Authentication with REST API
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:flutter/widgets.dart';
import 'package:tour_guide/models/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication with ChangeNotifier {
  String _userID;
  String _email;
  String _username;
  String _token;
  DateTime _expiryDate;
  Timer _authenticationTimer;

  String get userID {
    return _userID;
  }

  String get email {
    return _email;
  }

  String get username {
    return _username;
  }

  String get token {
    if (token != null &&
        _expiryDate != null &&
        _expiryDate.isAfter(DateTime.now())) {
      return _token;
    }
    return null;
  }

  bool get isAuthenticated {
    return token != null;
  }

  Future<void> _authenticate(
      String email, String password, String action) async {
    /// Action: 'SignUp' OR 'signInWithPassword'
    final apiKey = 'AIzaSyDpUWCfMS_wtdKSaCP63XIJ3IEA5e8LOyY';
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$action?key=$apiKey';

    /// Response Payload(REST API)
    try {
      final response = await https.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      /// For debugging ///*****
      print('**********************************************');
      print(response.statusCode);
      print(response.body);

      /*
      if (response.statusCode == 200) {
        print(json.decode(response.body));
      } else {
        print(response.statusCode);
      }
      */

      /*
      String jsonsDataString = response.body .toString(); 
      final responseData = jsonDecode(jsonsDataString);
      print(responseData.toString());
      */

      final responseData = json.decode(response.body);

      /// Error response payload(REST API)
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      _userID = responseData['localId'];
      _email = responseData['email'];
      _username = _email.substring(0, _email.indexOf('@'));
      _token = responseData['idToken'];

      /// For debugging
      print('**********************************************');
      print('/////Test $_username');
      if (_userID == null) {
        throw HttpException('Null ID');
      }

      /// For debugging ///*****
      print('**********************************************');
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

      //await _autoSignOut();
      _autoSignOut(); // ignore: unawaited_futures

      /// Provider
      notifyListeners();

      /// Shared Preferences, save data for auto sign in
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode({
        "userID": _userID,
        "token": _token,
        "expiryDate": _expiryDate.toIso8601String(),

        /// Standard format: toIso8601String()
      });

      // ignore: unawaited_futures
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
    _username = null;
    _token = null;
    _expiryDate = null;
    _authenticationTimer?.cancel();

    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    // ignore: unawaited_futures
    prefs.clear();

    /// For debugging ///*****
    print('**********************************************');
    print(_username);
  }

  //***TODO: check this again
  Future<bool> autoSignIn() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('TG_User')) {
      return false;
    }

    final savedUserData =
        json.decode(prefs.getString('TG_User')) as Map<String, dynamic>;
    _expiryDate = DateTime.parse(savedUserData['expiryDate']);

    /// For debugging ///*****
    print('**********************************************');
    if (_expiryDate.isBefore(DateTime.now())) {
      print('Expired');
      return false;
    }
    print('//Auto SignIn $savedUserData');

    /// End of for debugging ///*****

    try {
      _userID = savedUserData['userID'];
      _token = savedUserData['token'];
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
    }

    /// For debugging ///*****
    print('**********************************************');
    print('Test: $_token');
    print('_expiryDate: $_expiryDate');

    /// End of for debugging ///*****
    return true;
  }

  // ignore: missing_return
  Future<void> _autoSignOut() {
    if (_authenticationTimer != null) {
      _authenticationTimer.cancel();
    }
    _authenticationTimer =
        Timer(_expiryDate.difference(DateTime.now()), signOut);
  }
}
