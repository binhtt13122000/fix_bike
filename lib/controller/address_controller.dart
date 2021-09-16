import 'package:fix_bike/models/Location.dart';
import 'package:fix_bike/services/geo_service.dart';
import 'package:geocoder/geocoder.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressController extends GetxController {
  RxBool loading = false.obs;
  Rx<Marker> origin = new Marker(markerId: new MarkerId("origin")).obs;
  Rx<Location> location = new Location(lat: 0.0, lng: 0.0, address: "").obs;
  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  getLocation() async {
    loading.value = true;
    try {
      var positionResponse = await getCurrentLocation();
      location.value.lat = positionResponse.latitude;
      location.value.lng = positionResponse.longitude;
      origin.value = new Marker(
          markerId: new MarkerId("origin"),
          position: LatLng(location.value.lat, location.value.lng));
      var addressResponse = await Geocoder.local.findAddressesFromCoordinates(
          Coordinates(location.value.lat, location.value.lng));
      location.value.address = addressResponse.first.addressLine;
    } on Exception catch (_) {
      printError(info: "Error");
    } finally {
      new Future.delayed(
          const Duration(milliseconds: 3000), () => {loading.value = false});
    }
  }
}
