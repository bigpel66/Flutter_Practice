import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocaton;
  final bool isSelecting;

  MapScreen({
    this.initialLocaton = const PlaceLocation(
      latitude: 37.5123854,
      longitude: 127.0275176,
    ),
    this.isSelecting = false,
  });

  @override
  State createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Map')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocaton.latitude,
            widget.initialLocaton.longitude,
          ),
          zoom: 16,
        ),
      ),
    );
  }
}
