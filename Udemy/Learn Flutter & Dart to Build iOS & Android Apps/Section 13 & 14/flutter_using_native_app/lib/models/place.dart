import 'dart:io';
import 'package:flutter/material.dart';

class PlaceLocaton {
  final double latitude;
  final double longitude;
  final String address;

  PlaceLocaton({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocaton location;
  final File image;

  Place(
      {@required this.id,
      @required this.title,
      @required this.location,
      @required this.image});
}
