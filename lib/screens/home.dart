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
  final PlacesService placesService = PlacesService();
  final StatusAppController statusAppController =
      Get.put(StatusAppController());
  final TextEditingController _typeAheadController = TextEditingController();

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
      setState(() {
        destination = defautDestination;
      });
      if (destination != null) {
        _controller.future.then((value) => {
              value.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: destination!.position, zoom: 13)))
            });
        _controller.future.then(
            (value) => {value.showMarkerInfoWindow(MarkerId("destination"))});
      }
    } else if (statusAppController.status.value == 3) {
      if (destination != null) {
        drawLine(
            LatLng(addressController.location.value.getLat,
                addressController.location.value.getLng),
            destination!.position);
      }
    }
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
    if (destination != null) {
      DirectionsRepository()
          .getDirections(origin: origin, destination: destinationLatLng)
          .then((directions) => setState(() => _info = directions));
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newLatLngBounds(
          getBounds([destination!, addressController.origin.value]), 80.0));
    }
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
                    markers: {
                      addressController.origin.value,
                      if (destination != null) destination!
                    },
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 15,
                  left: 15,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TypeAheadField<Place>(
                                loadingBuilder: (context) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                noItemsFoundBuilder: (context) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                itemBuilder: (context, suggestion) {
                                  return ListTile(
                                    title: Text(suggestion.description),
                                  );
                                },
                                suggestionsCallback: (pattern) async {
                                  if (pattern == "")
                                    return List.empty();
                                  else
                                    return await placesService.getPlaces(
                                        input: pattern);
                                },
                                onSuggestionSelected: (suggestion) {
                                  this._typeAheadController.text =
                                      suggestion.description;
                                  addressController.setAddress(
                                      suggestion.description,
                                      suggestion.placeId,
                                      redraw);
                                },
                                textFieldConfiguration: TextFieldConfiguration(
                                  controller: this._typeAheadController,
                                  cursorColor: Colors.black,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.go,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide.none),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      hintText: "Chọn một địa chỉ khác...",
                                      filled: true,
                                      fillColor: Colors.white),
                                ))),
                      ],
                    ),
                  ),
                ),
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
                                              name: "Nguyễn Văn A",
                                              minutes: 15,
                                              destination:
                                                  destination!.position,
                                              origin: LatLng(
                                                  addressController
                                                      .location.value.getLat,
                                                  addressController
                                                      .location.value.getLng),
                                              draw: drawLine)
                                          : (statusAppController.status.value ==
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

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
