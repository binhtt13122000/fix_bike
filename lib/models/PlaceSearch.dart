import 'package:fix_bike/models/Geometry.dart';

class PlaceSearch {
  final Geometry geometry;
  final String name;
  final String vicinity;

  PlaceSearch(
      {required this.geometry, required this.name, required this.vicinity});

  factory PlaceSearch.fromJson(Map<String, dynamic> json) {
    return PlaceSearch(
      geometry: Geometry.fromJson(json['geometry']),
      name: json['formatted_address'],
      vicinity: json['vicinity'],
    );
  }
}
