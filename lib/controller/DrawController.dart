import 'package:fix_bike/models/Direction.dart';
import 'package:fix_bike/services/DirectionService.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DrawController extends GetxController {
  Rx<Directions?> direction = null.obs;

  setDirection(LatLng origin, LatLng destination) {
    DirectionsRepository()
        .getDirections(origin: origin, destination: destination)
        .then((directions) => direction.value = directions!);
  }
}
