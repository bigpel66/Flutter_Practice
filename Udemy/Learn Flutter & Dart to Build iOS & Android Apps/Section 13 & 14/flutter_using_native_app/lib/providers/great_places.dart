import 'dart:io';
import 'package:flutter/material.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _places = [];
  List<Place> get places {
    return [..._places];
  }

  addPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: image,
      title: title,
      location: null,
    );

    _places.add(newPlace);
    notifyListeners();
  }
}
