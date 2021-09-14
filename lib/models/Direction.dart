import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Directions {
  LatLngBounds bounds;
  List<PointLatLng> polylinePoints;
  String totalDistance;
  String totalDuration;
  LatLngBounds get getBounds => this.bounds;

  set setBounds(LatLngBounds bounds) => this.bounds = bounds;

  get getPolylinePoints => this.polylinePoints;

  set setPolylinePoints(polylinePoints) => this.polylinePoints = polylinePoints;

  get getTotalDistance => this.totalDistance;

  set setTotalDistance(totalDistance) => this.totalDistance = totalDistance;

  get getTotalDuration => this.totalDuration;

  set setTotalDuration(totalDuration) => this.totalDuration = totalDuration;

  Directions({
    required this.bounds,
    required this.polylinePoints,
    required this.totalDistance,
    required this.totalDuration,
  });

  factory Directions.fromMap(Map<String, dynamic> map) {
    // Get route information
    final data = Map<String, dynamic>.from(map['routes'][0]);

    // Bounds
    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
      northeast: LatLng(northeast['lat'], northeast['lng']),
      southwest: LatLng(southwest['lat'], southwest['lng']),
    );

    // Distance & Duration
    String distance = '';
    String duration = '';
    if ((data['legs'] as List).isNotEmpty) {
      final leg = data['legs'][0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    }

    return Directions(
      bounds: bounds,
      polylinePoints:
          PolylinePoints().decodePolyline(data['overview_polyline']['points']),
      totalDistance: distance,
      totalDuration: duration,
    );
  }
}
