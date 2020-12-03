class Guide {
  String imageUrl;
  String name;
  int age;
  int phonenumber;
  int price;
  int rating;

  Guide({
    this.imageUrl,
    this.name,
    this.age,
    this.phonenumber,
    this.price,
    this.rating,
  });
}

final List<Guide> guides = [
  Guide(
    imageUrl: 'assets/images/guide0.jpg',
    name: 'merlien',
    age: 25,
    phonenumber: 01019736549,
    price: 175,
    rating: 3,
  ),
  Guide(
    imageUrl: 'assets/images/guide1.jpg',
    name: 'andro jr.',
    age: 25,
    phonenumber: 01019765912,
    price: 300,
    rating: 4,
  ),
  Guide(
    imageUrl: 'assets/images/guide2.jpg',
    name: 'samantha jack',
    age: 25,
    phonenumber: 01013927849,
    price: 240,
    rating: 5,
  ),
  Guide(
    imageUrl: 'assets/images/marc.jpg',
    name: 'arron white',
    age: 25,
    phonenumber: 01011727849,
    price: 190,
    rating: 3,
  ),
  Guide(
    imageUrl: 'assets/images/omar.jpg',
    name: 'miley blake',
    age: 25,
    phonenumber: 01013207849,
    price: 140,
    rating: 2,
  ),
];
