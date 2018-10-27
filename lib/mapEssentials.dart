// Dependencies
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Main
void main() {
  // Initialize the Google Map controller
  GoogleMapController.init();

  // Setup box for rendering the map
  final size = MediaQueryData.fromWindow(ui.window).size;
  final GoogleMapOverlayController controller =
      GoogleMapOverlayController.fromSize(
    width: size.width,
    height: size.height - 72.0,
  );
  // Store map into a widget
  final Widget mapWidget = GoogleMapOverlay(controller: controller);

  // Store map controller into a variable
  final mapController = controller.mapController;
  // reroute marker tap events to a method
  mapController.onMarkerTapped.add((Marker m) {_onMarkerTapped(m);});

  runApp(new MaterialApp(
    title: "AccessU",
    theme: new ThemeData(primarySwatch: Colors.red),

    home: new Scaffold(
      appBar: AppBar(
        title: const Text("AccessU"),
        //----------------------------------------------------------------------
        // LOCATE BUTTON
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: () {
              // clear markers
              mapController.markers.clear();

              Future<Marker> _markerTest;

              final location = LatLng(24.934163, 67.044612);
              //_markerTest = mapController.addMarker();
              _markerTest = mapController.addMarker(new MarkerOptions(
                position: location,
              ));
              _markerTest.then((Marker x) {



              });

              //    .position(location)
              //    .title("Perth");
              //mPerth.setTag(0);
//              mapController.addMarker(MarkerOptions(
//                flat: true,
//                icon: BitmapDescriptor.defaultMarker,
//                infoWindowText: InfoWindowText(
//                  "ADA Marker Title",
//                  "ADA Marker Info"
//                ),
//                position: location,
//              ));
              mapController.animateCamera(
                CameraUpdate.newLatLngZoom(location, 15.0),
              );
            },
          ),
        ],
        //----------------------------------------------------------------------
      ),
      body: new MapDisplay(mapWidget, controller.mapController),
    ),

    // Change/move map display based on user navigation
    navigatorObservers: <NavigatorObserver>[controller.overlayController],
  ));
}

void _onMarkerTapped(Marker marker) {
  print("marker clicked!");
}

class MapDisplay extends StatelessWidget {
  // Constructor
  MapDisplay(this.mapWidget, this.controller);

  final Widget mapWidget;
  final GoogleMapController controller;

  @override
  Widget build(BuildContext context) {
    // Display map widget
    return Center(
      child: mapWidget,
    );
  }
}
