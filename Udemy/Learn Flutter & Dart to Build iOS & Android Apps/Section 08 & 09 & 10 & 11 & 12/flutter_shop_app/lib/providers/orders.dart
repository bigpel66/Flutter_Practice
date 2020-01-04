import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  int get listCount {
    return _orders.length;
  }

  void addOrder(List<CartItem> products, double amount) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: amount,
        products: products,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
