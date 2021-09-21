import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/models/Location.dart';
import 'package:fix_bike/models/PlaceSearch.dart';
import 'package:fix_bike/screens/repairman/bike_status_screen.dart';
import 'package:fix_bike/services/GeoService.dart';
import 'package:fix_bike/services/PlacesService.dart';
import 'package:geocoder/geocoder.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressController extends GetxController {
  RxBool loading = false.obs;
  Rx<Marker> origin = new Marker(markerId: new MarkerId("origin")).obs;
  Rx<Location> location = new Location(lat: 0.0, lng: 0.0).obs;
  RxString address = "".obs;
  RxList<Marker> markers = <Marker>[].obs;

  StatusAppController statusAppController = Get.put(StatusAppController());
  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  void setAddress(String addressString, String placeId, Function redraw) async {
    try {
      PlaceSearch placeSearch = await PlacesService().getPlace(placeId);
      address.value = addressString;
      location.value = new Location(
        lat: placeSearch.geometry.location.getLat,
        lng: placeSearch.geometry.location.getLng,
      );
      origin.value = new Marker(
          markerId: new MarkerId("origin"),
          position: LatLng(placeSearch.geometry.location.getLat,
              placeSearch.geometry.location.getLng));
      update();
    } on Exception catch (_) {
      printError(info: "Error");
    } finally {
      new Future.delayed(const Duration(milliseconds: 1000),
          () => {redraw(location.value.lat, location.value.lng)});
    }
  }

  void getLocation() async {
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
      address.value = addressResponse.first.addressLine;
      double lat = location.value.lat;
      double lng = location.value.lng;
      List<Marker> randomMarkers = [];
      randomMarkers.add(origin.value);
      randomMarkers.add(new Marker(
          markerId: new MarkerId("user_1"),
          position: LatLng(lat + 0.01, lng + 0.01),
          onTap: () {
            statusAppController.setMarkerId("user_1");
            Get.to(BikeStatusPage(),
                arguments: "user_1",
                transition: Transition.downToUp,
                duration: Duration(milliseconds: 600));
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueAzure)));
      randomMarkers.add(new Marker(
          markerId: new MarkerId("user_2"),
          position: LatLng(lat + 0.01, lng - 0.02),
          onTap: () {
            statusAppController.setMarkerId("user_2");
            Get.to(BikeStatusPage(),
                arguments: "user_2",
                transition: Transition.downToUp,
                duration: Duration(milliseconds: 600));
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueAzure)));
      randomMarkers.add(new Marker(
          markerId: new MarkerId("user_3"),
          position: LatLng(lat - 0.01, lng - 0.02),
          onTap: () {
            statusAppController.setMarkerId("user_3");
            Get.to(BikeStatusPage(),
                arguments: "user_3",
                transition: Transition.downToUp,
                duration: Duration(milliseconds: 600));
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueAzure)));
      randomMarkers.add(new Marker(
          markerId: new MarkerId("user_4"),
          position: LatLng(lat - 0.02, lng + 0.02),
          onTap: () {
            statusAppController.setMarkerId("user_4");
            Get.to(BikeStatusPage(),
                arguments: "user_4",
                transition: Transition.downToUp,
                duration: Duration(milliseconds: 600));
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueAzure)));
      markers.assignAll(randomMarkers);
    } on Exception catch (_) {
      printError(info: "Error");
    } finally {
      loading.value = false;
    }
  }
}
