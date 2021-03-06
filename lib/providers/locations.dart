import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:tour_guide/models/location_model.dart';
import 'package:tour_guide/providers/authentication.dart';
import 'package:http/http.dart' as http;
import 'package:tour_guide/screens/location_profile.dart';
import 'package:tour_guide/NotUsed/services/flutterfire.dart';


class Locations with ChangeNotifier {
  static const baseurl = "https://tourguide-422-default-rtdb.firebaseio.com/";

  String authToken;
  String userID;

  //Locations(this.authToken, this.userID, this._locationsList);

  List<Location> _locationsList = [
    // Location(
    //     index: '0',
    //     imageUrl: 'assets/images/Location0.jpg',
    //     coverImageUrl: 'assets/images/lc0.jpg',
    //     name: 'Pyramids of Giza',
    //     shortInfo: 'One of the seven wonders of the world',
    //     bio: 'Belonging to a civilization more than 7000 years old',
    //     address: 'Al Haram, Nazlet El-Semman, Al Giza Desert, Giza Governorate',
    //     price: 175,
    //     rating: 5.0),
    // Location(
    //     index: '1',
    //     imageUrl: 'assets/images/Location1.jpg',
    //     coverImageUrl: 'assets/images/lc1.jpg',
    //     name: 'Alexandria Library',
    //     shortInfo: 'a modern landmark of knowledge',
    //     bio:
    //         'Like a lighthouse for the world, the alexandria library stands vigil',
    //     address:
    //         'Al Azaritah WA Ash Shatebi, Qism Bab Sharqi, Alexandria Governorate 21526',
    //     price: 300,
    //     rating: 5.0),
    // Location(
    //     index: '2',
    //     imageUrl: 'assets/images/genericLocation.jpg',
    //     coverImageUrl: 'assets/images/genericLocationCover.jpg',
    //     name: 'Old Cairo',
    //     shortInfo: 'Coptic Cairo',
    //     bio:
    //         "This small church-filled cluster of twisty laneways lies within the walls of Old Babylon where the Roman Emperor Trajan first built a fortress along the Nile. Parts of the Roman towers still preside over the main street.",
    //     address: 'Old Cairo',
    //     price: 240,
    //     rating: 4.0),
    // Location(
    //     index: '3',
    //     imageUrl: 'assets/images/genericLocation.jpg',
    //     coverImageUrl: 'assets/images/genericLocationCover.jpg',
    //     name: 'The Egyptian Museum',
    //     shortInfo: 'One of the biggest homes to history',
    //     bio:
    //         "The absolutely staggering collection of antiquities displayed in Cairo's Egyptian Museum makes it one of the world's great museums",
    //     address: 'Cairo',
    //     price: 240,
    //     rating: 4.0),
    // Location(
    //     index: '4',
    //     imageUrl: 'assets/images/Location2.jpg',
    //     coverImageUrl: 'assets/images/lc2.jpg',
    //     name: 'Cairo Tower',
    //     shortInfo: 'Tallest Tower in Egypt and Africa',
    //     bio:
    //         "The Cairo Tower - commonly known to locals as Nasser's Pineapple - is a free-standing concrete tower in Cairo, Egypt. At 187 m, it has been the tallest structure in Egypt and North Africa for about 50 years.",
    //     address: 'Cairo',
    //     price: 240,
    //     rating: 4.0),
    // Location(
    //     index: '5',
    //     imageUrl: 'assets/images/genericLocation.jpg',
    //     coverImageUrl: 'assets/images/genericLocationCover.jpg',
    //     name: 'Al-Azhar Mosque',
    //     shortInfo: 'Islamic Architecture at its finest',
    //     bio:
    //         "Al-Azhar Mosque is the finest building of Cairo's Fatimid era and one of the city's earliest surviving mosques",
    //     address: 'Cairo',
    //     price: 240,
    //     rating: 4.0),
    // Location(
    //     index: '6',
    //     imageUrl: 'assets/images/genericLocation.jpg',
    //     coverImageUrl: 'assets/images/genericLocationCover.jpg',
    //     name: 'Khan el-Khalili',
    //     shortInfo: 'One of the worlds greatest shopping experiences',
    //     bio:
    //         "This Middle Eastern souq (bazaar) is a labyrinthine collection of skinny alleyways established as a shopping district in AD 1400, which still rings with the clang of metal workers and silversmiths.",
    //     address: 'Cairo',
    //     price: 240,
    //     rating: 4.0),
    // Location(
    //     index: '7',
    //     imageUrl: 'assets/images/genericLocation.jpg',
    //     coverImageUrl: 'assets/images/genericLocationCover.jpg',
    //     name: 'The Citadel',
    //     shortInfo: 'Saladins Citadel',
    //     bio:
    //         "In a commanding location at the foot of the Mokattam Hills, Cairo's citadel was built by Saladin in 1176. The original structure he laid out has long disappeared except for the eastern outer walls, but a legacy of rulers has made their own additions here.",
    //     address: 'Cairo',
    //     price: 240,
    //     rating: 4.0),
    // Location(
    //     index: '8',
    //     imageUrl: 'assets/images/genericLocation.jpg',
    //     coverImageUrl: 'assets/images/genericLocationCover.jpg',
    //     name: 'Sultan Hassan Mosque',
    //     shortInfo:
    //         'One of the finest examples of Mamluk architecture in the world',
    //     bio:
    //         "Sultan Hassan Mosque is a vision of Arabic artistry with an abundance of stalactite detailing and intricate arabesque features. It was built in 1356-63 for the Sultan Hassan el-Nasir.",
    //     address: 'Cairo',
    //     price: 240,
    //     rating: 4.0),
    // Location(
    //     index: '9',
    //     imageUrl: 'assets/images/genericLocation.jpg',
    //     coverImageUrl: 'assets/images/genericLocationCover.jpg',
    //     name: 'Museum of Islamic Art',
    //     shortInfo: 'Home of Islamic Art',
    //     bio:
    //         "Cairo's Museum of Islamic Art holds one of the most important collections of Middle Eastern artistry in the world.",
    //     address: 'Cairo ',
    //     price: 240,
    //     rating: 4.0),
    // Location(
    //     index: '10',
    //     imageUrl: 'assets/images/genericLocation.jpg',
    //     coverImageUrl: 'assets/images/genericLocationCover.jpg',
    //     name: 'Bab Zuweila',
    //     shortInfo:
    //         'Of all the Islamic Cairo districts gates, Bab Zuweila is the most interesting.',
    //     bio:
    //         "You can climb to the top of this medieval era relic (built in the 11th century) for some amazing rooftop views over Islamic Cairo. ",
    //     address: 'Cairo',
    //     price: 240,
    //     rating: 4.0),
    // Location(
    //     index: '11',
    //     imageUrl: 'assets/images/genericLocation.jpg',
    //     coverImageUrl: 'assets/images/genericLocationCover.jpg',
    //     name: 'Al-Azhar Park',
    //     shortInfo:
    //         'the gloriously manicured gardens are a lovely place for an evening stroll',
    //     bio:
    //         "It was opened in 2005 and provides a much needed respite to the overcrowded chaos of Cairo's street hustle.",
    //     address: 'Zamalek, Cairo Governorate',
    //     price: 240,
    //     rating: 4.0),
  ];



  List<Location> get favoriteItems {
    return _locationsList.where((prodItem) => prodItem.isFavorite).toList();
  }

  Location findById(String id) {
    return _locationsList.firstWhere((prod) => prod.index == id);
  }

  Future<bool> fetchAndSetLocations() async
  {

    _locationsList =[];
    await database.child("location").orderByKey().once().then((data) {Map<dynamic,dynamic> values= data.value;
    // print(data.value['loc104']);
    values.forEach((key, value) {
      _locationsList.add(Location(
        //index: values[key]["address"],
          imageUrl: values[key]["imageURL"],
          coverImageUrl: values[key]["coverURL"],
          name: values[key]["name"],
          shortInfo:
          values[key]["info"],
          bio:
          values[key]["bio"],
          address: values[key]["address"],
          price: values[key]["price"],
          rating: values[key]["rating"]
      ),
      );

    });});
    // print(_locationsList[0].name);
    notifyListeners();
    return true;
    //var url = '$baseurl/locations.json/?auth=$authToken&$';
    //  const baseurl = "https://tourguide-422-default-rtdb.firebaseio.com/location.json";
    //  try{
    //       final response = await http.get(baseurl);
    //  }
    // catch(error)
    // {
    //   throw(error);
    // }
  }

  List<Location> get locationsList {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return _locationsList;
  }
// void receiveToken(Authentication auth, List<Locations> items)
// {
//   authToken = auth.token;
//   userID = auth.userID;
//   print('locations recieveToken, userID: $userID');
//   _locationsList= locationsList;
// }
}
