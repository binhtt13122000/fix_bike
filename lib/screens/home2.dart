import 'dart:async';

import 'package:fix_bike/controller/address_controller.dart';
import 'package:fix_bike/models/Direction.dart';
import 'package:fix_bike/screens/home.dart';
import 'package:fix_bike/screens/message_screen.dart';
import 'package:fix_bike/screens/notifi_screen.dart';
import 'package:fix_bike/screens/profile_screen.dart';
import 'package:fix_bike/screens/repairman/bike_status_screen.dart';
import 'package:fix_bike/services/direction_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home2 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home2> {
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
        : Stack(
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
                          color: Colors.greenAccent,
                        ),
                        child: Column(
                          children: [
                            Center(
                                child: Text(
                              'Thông tin người sửa xe',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                            Text(
                              'Tên: Nguyễn Văn A',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Thời gian dự định: 15 phút',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  child: Text("Nhắn tin"),
                                  onPressed: () {
                                    Get.to(() => MessagePage(),
                                        transition:
                                            Transition.rightToLeftWithFade,
                                        duration: Duration(milliseconds: 500));
                                  },
                                ),
                                ElevatedButton(
                                  child: Text("Hủy"),
                                  onPressed: () {
                                    Get.to(() => Home(),
                                        transition:
                                            Transition.rightToLeftWithFade,
                                        duration: Duration(milliseconds: 500));
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ));
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
