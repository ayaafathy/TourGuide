import 'package:http/http.dart' as http;

class User {
  String imageUrl;
  String name;

  User({
    this.imageUrl,
    this.name,
  });
}

final List<User> hotels = [
  User(
    imageUrl: 'assets/images/users/marc.jpg',
    name: 'Marc Ashraf',
  ),
];
