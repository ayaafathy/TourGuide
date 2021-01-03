import 'package:http/http.dart' as http;

class User {
  String imageUrl;
  String name;
  String email;
  String username;
  String password;

  User({this.imageUrl, this.name, this.email, this.username, this.password});
}

final List<User> hotels = [
  User(
    imageUrl: 'assets/images/users/marc.jpg',
    name: 'Marc Ashraf',
  ),
];
