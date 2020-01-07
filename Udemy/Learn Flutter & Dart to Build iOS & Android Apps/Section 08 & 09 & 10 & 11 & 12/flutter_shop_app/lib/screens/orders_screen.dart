import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop_app/widgets/app_drawer.dart';
import '../widgets/order_list.dart';
import '../providers/orders.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Order List')),
      drawer: AppDrawer(),
      body: OrderList(),
    );
  }
}
