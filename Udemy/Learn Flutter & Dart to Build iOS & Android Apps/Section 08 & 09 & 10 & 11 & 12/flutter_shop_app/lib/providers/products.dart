import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoritedItems {
    return _items.where((item) {
      return item.isFavorited;
    }).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((item) {
      return item.id == id;
    });
  }

  Future<void> fetchAndSetProducts() async {
    const url = 'https://flutter-shop-app-114ec.firebaseio.com/products.json';

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      extractedData.forEach((id, data) {
        loadedProducts.add(Product(
          id: id,
          title: data['title'],
          description: data['description'],
          price: data['price'],
          imageUrl: data['imageUrl'],
          isFavorited: data['isFavorited'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    const url = 'https://flutter-shop-app-114ec.firebaseio.com/products.json';

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'id': product.id,
          'title': product.title,
          'price': product.price,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'isFavorited': product.isFavorited,
        }),
      );

      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );

      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  void updateProduct(String id, Product editedProduct) {
    final productIndex = _items.indexWhere((item) {
      return item.id == id;
    });

    if (productIndex >= 0) {
      _items[productIndex] = editedProduct;
      notifyListeners();
    }
  }

  void removeProduct(String id) {
    _items.removeWhere((item) {
      return item.id == id;
    });
    notifyListeners();
  }
}
