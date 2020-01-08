import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  final String authToken;
  final String userId;

  List<OrderItem> _orders = [];

  Orders(this.authToken, this.userId, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  int get listCount {
    return _orders.length;
  }

  Future<void> fetchAndSetOrders() async {
    final url =
        'https://flutter-shop-app-114ec.firebaseio.com/orders/$userId/json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<OrderItem> loadedOrders = [];

      if (extractedData == null) {
        print(1);
        return;
      }

      extractedData.forEach((id, item) {
        loadedOrders.add(OrderItem(
          id: id,
          amount: item['amount'],
          products: (item['products'] as List<dynamic>).map((item) {
            return CartItem(
              id: item['id'],
              title: item['title'],
              quantity: item['quantity'],
              price: item['price'],
              imageUrl: item['imageUrl'],
            );
          }).toList(),
          dateTime: DateTime.parse(item['dateTime']),
        ));
      });
      _orders = loadedOrders.reversed.toList();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addOrder(List<CartItem> products, double amount) async {
    final url =
        'https://flutter-shop-app-114ec.firebaseio.com/orders/$userId/json?auth=$authToken';
    final timeStamp = DateTime.now();
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'amount': amount,
          'products': products.map((item) {
            return {
              'id': item.id,
              'title': item.title,
              'quantity': item.quantity,
              'price': item.price,
              'imageUrl': item.imageUrl,
            };
          }).toList(),
          'dateTime': timeStamp.toIso8601String(),
        }),
      );

      _orders.insert(
        0,
        OrderItem(
          id: json.decode(response.body)['name'],
          amount: amount,
          products: products,
          dateTime: timeStamp,
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
