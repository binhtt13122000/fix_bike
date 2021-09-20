import 'package:fix_bike/models/Place.dart';
import 'package:fix_bike/models/PlaceSearch.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

final googleApiKey = "";

class Response {
  List<Place> predictions = List.empty();
  String status = "";
  List<Place> get getPredictions => this.predictions;

  set setPredictions(List<Place> predictions) => this.predictions = predictions;

  get getStatus => this.status;

  set setStatus(status) => this.status = status;
}

class PlacesService {
  Future<List<Place>> getPlaces({
    required String input,
  }) async {
    if (input.trim() != "") {
      var url =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$googleApiKey&components=country:vn&language=vi';
      var response = await http.get(Uri.parse(url), headers: {"Accept": "*/*"});
      var json = convert.jsonDecode(response.body);
      var jsonResults = json['predictions'] as List;
      return jsonResults.map((place) => Place.fromJson(place)).toList();
    }
    return List.empty();
  }

  Future<PlaceSearch> getPlace(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$googleApiKey';
    var response = await http.get(Uri.parse(url), headers: {"Accept": "*/*"});
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    return PlaceSearch.fromJson(jsonResult);
  }
}
