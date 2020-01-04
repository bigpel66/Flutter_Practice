import 'package:flutter/material.dart';
import '../widgets/order_list.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Order List')),
      body: OrderList(),
    );
  }
}
