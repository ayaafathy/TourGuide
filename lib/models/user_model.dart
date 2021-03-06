import 'package:http/http.dart' as http;

class User {
  User({this.imageUrl, this.name, this.email, this.username, this.password});
  String imageUrl;
  String name;
  String email;
  String username;
  String password;
}

final List<User> hotels = [
  User(
    imageUrl: 'assets/images/users/marc.jpg',
    name: 'Marc Ashraf',
  ),
];
