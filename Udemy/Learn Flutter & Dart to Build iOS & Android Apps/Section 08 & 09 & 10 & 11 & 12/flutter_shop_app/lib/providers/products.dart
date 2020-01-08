import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './product.dart';
import '../models/http_exception.dart';

class Products with ChangeNotifier {
  final String authToken;
  final String userId;
  List<Product> _items = [];

  Products(this.authToken, this.userId, this._items);

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

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filteringString =
        filterByUser ? 'orderBy="userId"&equalTo="$userId"' : '';
    var url =
        'https://flutter-shop-app-114ec.firebaseio.com/products.json?auth=$authToken&$filteringString';

    // var url = 'https://flutter-shop-app-114ec.firebaseio.com/products.json';

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];

      if (extractedData == null) {
        return;
      }

      url =
          'https://flutter-shop-app-114ec.firebaseio.com/userFavorites/$userId.json?auth=$authToken';

      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);

      extractedData.forEach((id, data) {
        print(data['title']);
        print(data['description']);
        print(data['price']);
        print(data['imageUrl']);

        loadedProducts.add(Product(
          id: id,
          title: data['title'],
          description: data['description'],
          price: data['price'],
          isFavorited: favoriteData == null ? false : favoriteData[id] ?? false,
          imageUrl: data['imageUrl'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    final url =
        'https://flutter-shop-app-114ec.firebaseio.com/products.json?$authToken';

    // final url = 'https://flutter-shop-app-114ec.firebaseio.com/products.json';

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'price': product.price,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'userId': userId,
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
          'https://flutter-shop-app-114ec.firebaseio.com/products/$id.json?auth=$authToken';

      // final url =
      // 'https://flutter-shop-app-114ec.firebaseio.com/products/$id.json';

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
        'https://flutter-shop-app-114ec.firebaseio.com/products/$id.json?auth=$authToken';

    // final url =
    //     'https://flutter-shop-app-114ec.firebaseio.com/products/$id.json';

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
