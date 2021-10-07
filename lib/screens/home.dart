import 'dart:async';
import 'dart:math';

import 'package:fix_bike/controller/AddressController.dart';
import 'package:fix_bike/controller/OrderController.dart';
import 'package:fix_bike/controller/StatusAppController.dart';
import 'package:fix_bike/models/Direction.dart';
import 'package:fix_bike/models/Place.dart';
import 'package:fix_bike/screens/home_screen/Fixed.dart';
import 'package:fix_bike/screens/home_screen/Found.dart';
import 'package:fix_bike/screens/home_screen/Main.dart';
import 'package:fix_bike/screens/home_screen/Normal.dart';
import 'package:fix_bike/screens/home_screen/Ordered.dart';
import 'package:fix_bike/components/BottomNav.dart';
import 'package:fix_bike/screens/home_screen/Waiting.dart';
import 'package:fix_bike/services/DirectionService.dart';
import 'package:fix_bike/services/PlacesService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
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
  final OrderController orderController = Get.put(OrderController());
  final PlacesService placesService = PlacesService();
  final StatusAppController statusAppController =
      Get.put(StatusAppController());

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

  Marker destination = new Marker(
      markerId: new MarkerId("destination"),
      position: LatLng(10.82702513577814, 106.7230868106364),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      infoWindow: InfoWindow(
        title: "Nguyễn Văn A",
      ));
  Directions? _info;

  //height
  double _height = 200;

  @override
  void initState() {
    super.initState();
    // if (statusAppController.status.value == 1 ||
    //     statusAppController.status.value == 4) {
    //   cancel();
    // } else if (statusAppController.status.value == 2) {
    //   setState(() {
    //     destination = defautDestination;
    //   });
    //   // if (destination != null) {
    //   // _controller.future.then((value) => {
    //   //       value.animateCamera(CameraUpdate.newCameraPosition(
    //   //           CameraPosition(target: destination!.position, zoom: 13)))
    //   //     });
    //   // _controller.future.then(
    //   //     (value) => {value.showMarkerInfoWindow(MarkerId("destination"))});
    //   // }
    // } else if (statusAppController.status.value == 3) {
    //   if (destination != null) {
    //     drawLine(
    //         LatLng(addressController.location.value.getLat,
    //             addressController.location.value.getLng),
    //         destination!.position);
    //   }
    // }
  }

  redraw(lat, lng) {
    _controller.future.then((value) => {
          value.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(target: LatLng(lat, lng), zoom: 15)))
        });
  }

  cancel() {
    setState(() {
      _info = null;
    });
    _controller.future.then((value) => {
          value.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(addressController.location.value.lat,
                  addressController.location.value.lng),
              zoom: 15)))
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
    print("MM");
    DirectionsRepository()
        .getDirections(origin: origin, destination: destinationLatLng)
        .then((directions) => setState(() => _info = directions));
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngBounds(
        getBounds([destination, addressController.origin.value]), 80.0));
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
                        zoom: 15),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: {addressController.origin.value, destination},
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
                if (orderController.singleOrderApp.status == 1) ...[
                  Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      height: _height,
                      child: Container(
                        color: Colors.white,
                        child: Container(
                            child: Column(
                          children: [
                            GestureDetector(
                              child: FittedBox(
                                  child: Text(
                                "----",
                                style: TextStyle(
                                    color: Colors.grey[300], fontSize: 40),
                              )),
                              onPanUpdate: (details) {
                                setState(() {
                                  _height -= details.delta.dy;

                                  // prevent overflow if height is more/less than available space
                                  var maxLimit = 400.0;
                                  var minLimit = 200.0;

                                  if (_height > maxLimit)
                                    _height = maxLimit;
                                  else if (_height < minLimit)
                                    _height = minLimit;
                                });
                              },
                            ),
                            MainModal(
                                height: _height,
                                destination: destination.position,
                                origin: LatLng(
                                    addressController.location.value.getLat,
                                    addressController.location.value.getLng),
                                draw: drawLine),
                          ],
                        )),
                      ))
                ],
              ],
            ),
          ));
  }

// Future<void> _goToTheLake() async {
//   final GoogleMapController controller = await _controller.future;
//   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
// }
}


// (Container(
//                           child: Row(
//                             children: <Widget>[
//                               Expanded(
//                                   child: Container(
//                                 width: double.infinity,
//                                 height: 200,
//                                 decoration: BoxDecoration(color: Colors.white),
//                                 child: Padding(
//                                     padding: EdgeInsets.all(15),
//                                     child: statusAppController.status.value == 2
//                                         ? Found(
//                                             destination: destination!.position,
//                                             origin: LatLng(
//                                                 addressController
//                                                     .location.value.getLat,
//                                                 addressController
//                                                     .location.value.getLng),
//                                             draw: drawLine)
//                                         : (statusAppController.status.value == 3
//                                             ? Ordered(
//                                                 name: "Nguyễn Văn A",
//                                                 minutes: 15,
//                                                 cancel: cancel)
//                                             : (statusAppController
//                                                         .status.value ==
//                                                     4
//                                                 ? Fixed(
//                                                     cancel: cancel,
//                                                     money: "150.000",
//                                                   )
//                                                 : null))),
//                               )),
//                             ],
//                           ),
//                         ))
