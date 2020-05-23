import 'package:flutter/material.dart';

class Item {
  final String title;
  final int price;

  Item({@required this.title, @required this.price});
}

final itemList = [
  Item(title: 'iMac', price: 1234567),
  Item(title: 'iPhone', price: 1234567),
  Item(title: 'iPad', price: 1234567),
  Item(title: 'AirPods', price: 1234567),
  Item(title: 'MacBook', price: 1234567),
];
