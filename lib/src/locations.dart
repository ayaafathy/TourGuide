import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'locations.g.dart';

@JsonSerializable()
class LatLng {
  LatLng({
    this.lat,
    this.lng,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);

  final double lat;
  final double lng;
}

@JsonSerializable()
class Region {
  Region({
    this.coords,
    this.id,
    this.name,
    this.zoom,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);

  final LatLng coords;
  final String id;
  final String name;
  final double zoom;
}

@JsonSerializable()
class Tours {
  Tours({
    this.address,
    this.id,
    this.image,
    this.lat,
    this.lng,
    this.name,
    this.region,
  });

  factory Tours.fromJson(Map<String, dynamic> json) => _$ToursFromJson(json);
  Map<String, dynamic> toJson() => _$ToursToJson(this);

  final String address;
  final String id;
  final String image;
  final double lat;
  final double lng;
  final String name;
  final String region;
}

@JsonSerializable()
class Locations {
  Locations({
    this.tours,
    this.regions,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<Tours> tours;
  final List<Region> regions;
}

Future<Locations> getGoogleTours() async {
  const googleLocationsURL = 'file:///C:/xampp/htdocs/TourGuide/Locations.json';

  // Retrieve the locations of Google Tours
  final response = await http.get(googleLocationsURL);
  if (response.statusCode == 200) {
    return Locations.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(googleLocationsURL));
  }
}
