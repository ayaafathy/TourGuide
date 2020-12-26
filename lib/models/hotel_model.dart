import 'package:tour_guide/models/rooms_model.dart';

class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;
  List<Room> rooms;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
    this.rooms,
  });
}

List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Black nights hotel',
    address: '404 Great St',
    price: 175,
    rooms: rooms,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Trump tower hotel',
    address: '187, Newyork, ',
    price: 300,
    rooms: rooms,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Jack marlon hotel',
    address: '404 Great St',
    price: 240,
    rooms: rooms,
  ),
];

List<Room> rooms = [
  Room(
    imageUrl: 'assets/images/hotel0.jpg',
    type: 'Master bedroom',
    rating: 5,
    price: 300,
  ),
  Room(
    imageUrl: 'assets/images/hotel1.jpg',
    type: 'triple bedroom',
    rating: 3,
    price: 150,
  ),
  Room(
    imageUrl: 'assets/images/hotel2.jpg',
    type: 'double bedroom',
    rating: 4,
    price: 200,
  ),
];
