class Place {
  final String description;
  final String placeId;

  Place({required this.description, required this.placeId});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(description: json['description'], placeId: json['place_id']);
  }
}
