class Location {
  double lat;
  double lng;
  String address;

  double get getLat => this.lat;

  set setLat(double lat) => this.lat = lat;

  get getLng => this.lng;

  set setLng(lng) => this.lng = lng;

  get getAddress => this.address;

  set setAddress(address) => this.address = address;

  Location({required this.lat, required this.lng, required this.address});

  factory Location.fromJson(Map<dynamic, dynamic> parsedJson) {
    return Location(
        lat: parsedJson['lat'],
        lng: parsedJson['lng'],
        address: parsedJson['address']);
  }
}
