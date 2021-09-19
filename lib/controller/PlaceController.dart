import 'package:fix_bike/models/Place.dart';
import 'package:fix_bike/services/PlacesService.dart';
import 'package:get/get.dart';

class PlaceController extends GetxController {
  RxList<Place> places = <Place>[].obs;

  getPlaces(String input) {
    if (input.isEmpty) {
      places.value = List.empty();
    }
    PlacesService()
        .getPlaces(input: input)
        .then((placeArr) => places.value = placeArr);
  }
}
