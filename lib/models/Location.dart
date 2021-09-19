class Location {
  double lat;
  double lng;

  double get getLat => this.lat;

  set setLat(double lat) => this.lat = lat;

  get getLng => this.lng;

  set setLng(lng) => this.lng = lng;

  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Location(
      lat: parsedJson['lat'],
      lng: parsedJson['lng'],
    );
  }
}
