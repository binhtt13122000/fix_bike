import 'dart:async';

import 'package:fix_bike/controller/address_controller.dart';
import 'package:fix_bike/models/Direction.dart';
import 'package:fix_bike/screens/notifi_screen.dart';
import 'package:fix_bike/screens/profile_screen.dart';
import 'package:fix_bike/screens/repairman/bike_status_screen.dart';
import 'package:fix_bike/services/direction_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        Get.to(() => ProfilePage(),
            transition: Transition.rightToLeftWithFade,
            duration: Duration(milliseconds: 600));
      } else if (_selectedIndex == 2) {
        Get.to(() => NotificationPage(),
            transition: Transition.rightToLeftWithFade,
            duration: Duration(milliseconds: 600));
      }
    });
  }

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
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Trang chủ"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_box), label: "Thông tin"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: "Thông báo"),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ));
  }
}

class MapGoogle extends StatefulWidget {
  @override
  State<MapGoogle> createState() => MapGoogleState();
}

class MapGoogleState extends State<MapGoogle> {
  Completer<GoogleMapController> _controller = Completer();
  Marker destination = new Marker(
      markerId: new MarkerId("destination"),
      position: LatLng(10.84686530968016, 106.77740048180068));
  Directions? _info;
  @override
  void initState() {
    super.initState();
  }

  void drawLine(LatLng origin, LatLng destination) async {
    DirectionsRepository()
        .getDirections(origin: origin, destination: destination)
        .then((directions) => setState(() => _info = directions));
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: destination, zoom: 13)));
  }

  @override
  Widget build(BuildContext context) {
    final AddressController addressController = Get.put(AddressController());
    return Obx(() => addressController.loading.isTrue
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 7,
                  child: Stack(
                    children: <Widget>[
                      // Replace this container with your Map widget
                      Container(
                        color: Colors.black,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          zoomControlsEnabled: true,
                          zoomGesturesEnabled: true,
                          polylines: {
                            if (_info != null)
                              Polyline(
                                polylineId:
                                    const PolylineId('overview_polyline'),
                                color: Colors.red,
                                width: 5,
                                points: _info!.polylinePoints
                                    .map((e) => LatLng(e.latitude, e.longitude))
                                    .toList(),
                              ),
                          },
                          initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  addressController.location.value.lat,
                                  addressController.location.value.lng),
                              zoom: 15),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                          markers: {
                            addressController.origin.value,
                            destination
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
                                  child: TypeAheadField<String>(
                                      itemBuilder: (context, suggestion) {
                                        return ListTile(
                                          title: Text(suggestion),
                                        );
                                      },
                                      suggestionsCallback: (pattern) {
                                        if (pattern == "")
                                          return [];
                                        else
                                          return ["1"];
                                      },
                                      onSuggestionSelected: (suggestion) {},
                                      textFieldConfiguration:
                                          TextFieldConfiguration(
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
                                                EdgeInsets.symmetric(
                                                    horizontal: 15),
                                            hintText:
                                                "Chọn một địa chỉ khác...",
                                            filled: true,
                                            fillColor: Colors.white),
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: new TextSpan(
                              // Note: Styles for TextSpans must be explicitly defined.
                              // Child text spans will inherit styles from parent
                              style: new TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: 'Địa Chỉ: ',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold)),
                                new TextSpan(
                                  text:
                                      addressController.location.value.address,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // ElevatedButton(
                              //   child: Text("Tìm đường"),
                              //   onPressed: () => drawLine(
                              //       addressController.origin.value.position,
                              //       destination.position),
                              // ),
                              ElevatedButton(
                                child: Text("Cập nhật tình trạng xe"),
                                onPressed: () {
                                  Get.to(() => BikeStatusPage(),
                                      transition:
                                          Transition.rightToLeftWithFade,
                                      duration: Duration(milliseconds: 500));
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ));
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
