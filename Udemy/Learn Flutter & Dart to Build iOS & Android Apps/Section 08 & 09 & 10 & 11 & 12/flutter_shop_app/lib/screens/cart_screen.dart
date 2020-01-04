import 'package:flutter/material.dart';
import '../widgets/cart_list.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: CartList(),
    );
  }
}
