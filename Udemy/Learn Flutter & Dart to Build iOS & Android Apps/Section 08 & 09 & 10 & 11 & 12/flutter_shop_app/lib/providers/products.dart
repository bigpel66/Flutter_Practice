import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './product.dart';
import '../models/http_exception.dart';

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

      if (extractedData == null) {
        return;
      }

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

  Future<void> updateProduct(String id, Product editedProduct) async {
    final productIndex = _items.indexWhere((item) {
      return item.id == id;
    });

    if (productIndex >= 0) {
      final url =
          'https://flutter-shop-app-114ec.firebaseio.com/products/$id.json';
      try {
        await http.patch(url,
            body: json.encode({
              'title': editedProduct.title,
              'price': editedProduct.price,
              'description': editedProduct.description,
              'imageUrl': editedProduct.imageUrl,
            }));
        _items[productIndex] = editedProduct;
        notifyListeners();
      } catch (error) {
        throw error;
      }
    }
  }

  Future<void> removeProduct(String id) async {
    final url =
        'https://flutter-shop-app-114ec.firebaseio.com/products/$id.json';
    final existingProductIndex = _items.indexWhere((item) {
      return id == item.id;
    });
    Product existingProduct = _items[existingProductIndex];

    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }
}
