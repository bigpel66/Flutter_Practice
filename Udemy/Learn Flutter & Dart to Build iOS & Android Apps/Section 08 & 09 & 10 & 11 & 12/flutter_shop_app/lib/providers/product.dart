import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/http_exception.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorited;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorited = false,
  });

  void _setFav(bool favStatus) {
    isFavorited = favStatus;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorited;

    final url =
        'https://flutter-shop-app-114ec.firebaseio.com/userFavorites/$userId/$id.json?auth=$token';

    _setFav(!isFavorited);
    final response = await http.put(
      url,
      body: json.encode(
        isFavorited,
      ),
    );

    if (response.statusCode >= 400) {
      _setFav(oldStatus);
      throw HttpException('Could not update the item.');
    }
  }
}
