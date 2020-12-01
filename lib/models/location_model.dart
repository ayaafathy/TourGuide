class Location {
  String imageUrl = 'assets/images/genericLocation.jpg';
  String coverImageUrl = 'assets/images/genericLocationCover.jpg';
  String name;
  String shortInfo;
  String bio;
  String address;
  int price;
  var rating;

  Location({
    this.imageUrl,
    this.coverImageUrl,
    this.name,
    this.shortInfo,
    this.bio,
    this.address,
    this.price,
    this.rating
  });
}

final List<Location> locations = [
  Location(
      imageUrl: 'assets/images/Location0.jpg',
      coverImageUrl: 'assets/images/lc0.jpg',
      name: 'Pyramids of Giza',
      shortInfo: 'One of the seven wonders of the world',
      bio: 'Belonging to a civilization more than 7000 years old',
      address: 'Al Haram, Nazlet El-Semman, Al Giza Desert, Giza Governorate',
      price: 175,
      rating: 5.0
  ),
  Location(
      imageUrl: 'assets/images/Location1.jpg',
      coverImageUrl: 'assets/images/lc1.jpg',
      name: 'Alexandria Library',
      shortInfo: 'a modern landmark of knowledge',
      bio: 'Like a lighthouse for the world, the alexandria library stands vigil',
      address: 'Al Azaritah WA Ash Shatebi, Qism Bab Sharqi, Alexandria Governorate 21526',
      price: 300,
      rating: 5.0
  ),
  Location(
      imageUrl: 'assets/images/Location2.jpg',
      coverImageUrl: 'assets/images/lc2.jpg',
      name: 'Cairo Tower',
      shortInfo: 'Tallest Tower in Egypt and Africa',
      bio: "The Cairo Tower - commonly known to locals as Nasser's Pineapple - is a free-standing concrete tower in Cairo, Egypt. At 187 m, it has been the tallest structure in Egypt and North Africa for about 50 years.",
      address: 'Zamalek, Cairo Governorate',
      price: 240,
      rating: 4.5
  ),
];