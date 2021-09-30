import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:fix_bike/models/Location.dart';
import 'package:fix_bike/models/PlaceSearch.dart';
import 'package:fix_bike/services/GeoService.dart';
import 'package:fix_bike/services/PlacesService.dart';
import 'package:fix_bike/styles/MyIcon.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressController extends GetxController {
  RxBool loading = false.obs;
  Rx<Marker> origin = new Marker(markerId: new MarkerId("origin")).obs;
  Rx<Location> location = new Location(lat: 0.0, lng: 0.0).obs;
  RxString address = "".obs;
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
      final Uint8List markerIcon =
          await getBytesFromAsset('../../assets/images/marker.png', 100);
      origin.value = new Marker(
          markerId: new MarkerId("origin"),
          icon: BitmapDescriptor.fromBytes(markerIcon),
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

  getLocation() async {
    loading.value = true;
    try {
      var positionResponse = await getCurrentLocation();
      location.value.lat = positionResponse.latitude;
      location.value.lng = positionResponse.longitude;
      final Uint8List markerIcon = await getBytesFromAsset(iconMarker, 100);
      origin.value = new Marker(
          markerId: new MarkerId("origin"),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          position: LatLng(location.value.lat, location.value.lng));
      var addressResponse = await Geocoder.local.findAddressesFromCoordinates(
          Coordinates(location.value.lat, location.value.lng));
      address.value = addressResponse.first.addressLine;
    } on Exception catch (_) {
      printError(info: "Error");
    } finally {
      loading.value = false;
    }
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
