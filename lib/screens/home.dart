import 'dart:async';
import 'dart:math';

import 'package:fix_bike/controller/AddressController.dart';
import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/models/Direction.dart';
import 'package:fix_bike/models/Place.dart';
import 'package:fix_bike/screens/home_screen/Fixed.dart';
import 'package:fix_bike/screens/home_screen/Found.dart';
import 'package:fix_bike/screens/home_screen/Normal.dart';
import 'package:fix_bike/screens/home_screen/Ordered.dart';
import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/services/DirectionService.dart';
import 'package:fix_bike/services/PlacesService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: MapGoogle(),
              bottomNavigationBar: BottomNav(),
            )));
  }
}

class MapGoogle extends StatefulWidget {
  @override
  State<MapGoogle> createState() => MapGoogleState();
}

class MapGoogleState extends State<MapGoogle> {
  Completer<GoogleMapController> _controller = Completer();
  final AddressController addressController = Get.put(AddressController());
  final PlacesService placesService = PlacesService();
  final StatusAppController statusAppController =
      Get.put(StatusAppController());
  Marker? destination;
  Marker defautDestination = new Marker(
      markerId: new MarkerId("destination"),
      position: LatLng(10.84686530968016, 106.77740048180068),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      infoWindow: InfoWindow(
        title: "Nguyễn Văn A",
      ));
  Directions? _info;
  @override
  void initState() {
    super.initState();
    if (statusAppController.status.value == 1 ||
        statusAppController.status.value == 4) {
      cancel();
    } else if (statusAppController.status.value == 2) {
      if (addressController.markers.isNotEmpty &&
          statusAppController.markerId.value.isNotEmpty) {
        setState(() {
          destination = addressController.markers.firstWhere((element) =>
              element.markerId.value == statusAppController.markerId.value);
        });
        drawLine(
            LatLng(addressController.location.value.lat,
                addressController.location.value.lng),
            destination!.position);
      }
    } else if (statusAppController.status.value == 3) {}
  }

  double getZoomLevel(double radius) {
    double zoomLevel = 11;
    if (radius > 0) {
      double radiusElevated = radius + radius / 2;
      double scale = radiusElevated / 500;
      zoomLevel = 16 - log(scale) / log(2);
    }
    zoomLevel = double.parse(zoomLevel.toStringAsFixed(2));
    return zoomLevel;
  }

  void toggleSwitch(bool value) {
    if (statusAppController.switched.isFalse) {
      statusAppController.setSwitch(true);
      statusAppController.zoom.value = getZoomLevel(3000);
    } else {
      statusAppController.setSwitch(false);
      statusAppController.zoom.value = 15.0;
    }
    _controller.future.then((value) => {
          value.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(addressController.location.value.lat,
                  addressController.location.value.lng),
              zoom: statusAppController.zoom.value)))
        });
  }

  redraw(lat, lng) {
    _controller.future.then((value) => {
          value.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(lat, lng), zoom: 15)))
        });
  }

  cancel() {
    setState(() {
      destination = null;
      _info = null;
    });
    _controller.future.then((value) => {
          value.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(addressController.location.value.lat,
                  addressController.location.value.lng),
              zoom: statusAppController.zoom.value)))
        });
  }

  LatLngBounds getBounds(List<Marker> markers) {
    var lngs = markers.map<double>((m) => m.position.longitude).toList();
    var lats = markers.map<double>((m) => m.position.latitude).toList();

    double topMost = lngs.reduce(max);
    double leftMost = lats.reduce(min);
    double rightMost = lats.reduce(max);
    double bottomMost = lngs.reduce(min);

    LatLngBounds bounds = LatLngBounds(
      northeast: LatLng(rightMost, topMost),
      southwest: LatLng(leftMost, bottomMost),
    );

    return bounds;
  }

  void drawLine(LatLng origin, LatLng destinationLatLng) async {
    if (destination != null) {
      DirectionsRepository()
          .getDirections(origin: origin, destination: destinationLatLng)
          .then((directions) => setState(() => _info = directions));
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLngBounds(
          getBounds([destination!, addressController.origin.value]), 80.0));
    }
  }

  void onTap(String markerId) {
    setState(() {
      destination = Marker(markerId: MarkerId(markerId));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => addressController.loading.isTrue
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: Stack(
              children: <Widget>[
                // Replace this container with your Map widget
                Container(
                  child: GoogleMap(
                    mapType: MapType.normal,
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: true,
                    polylines: {
                      if (_info != null)
                        Polyline(
                          polylineId: const PolylineId('overview_polyline'),
                          color: Colors.red,
                          width: 5,
                          points: _info!.polylinePoints
                              .map((e) => LatLng(e.latitude, e.longitude))
                              .toList(),
                        ),
                    },
                    initialCameraPosition: CameraPosition(
                        target: LatLng(addressController.location.value.lat,
                            addressController.location.value.lng),
                        zoom: statusAppController.zoom.value),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: statusAppController.switched.isTrue
                        ? (destination != null
                            ? {destination!, addressController.origin.value}
                            : addressController.markers.toSet())
                        : {addressController.origin.value},
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 15,
                  left: 15,
                  child: Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Switch(
                        onChanged: toggleSwitch,
                        value: statusAppController.switched.value,
                        activeColor: Colors.blue,
                      )
                    ],
                  )),
                ),
                if (statusAppController.status.value != 1)
                  Positioned(
                    right: 15,
                    left: 15,
                    bottom: 20,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: statusAppController.status.value == 1
                                        ? Normal()
                                        : (statusAppController.status.value == 2
                                            ? Found(
                                                destination:
                                                    destination!.position,
                                                origin: LatLng(
                                                    addressController
                                                        .location.value.getLat,
                                                    addressController
                                                        .location.value.getLng),
                                              )
                                            : (statusAppController
                                                        .status.value ==
                                                    3
                                                ? Ordered(
                                                    name: "Nguyễn Văn A",
                                                    minutes: 15,
                                                    cancel: cancel)
                                                : (statusAppController
                                                            .status.value ==
                                                        4
                                                    ? Fixed(
                                                        cancel: cancel,
                                                        money: "150.000",
                                                      )
                                                    : null))),
                                  ))),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ));
  }
}
