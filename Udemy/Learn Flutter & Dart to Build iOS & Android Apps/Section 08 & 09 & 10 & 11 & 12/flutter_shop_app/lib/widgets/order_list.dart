import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './order_list_item.dart';
import '../providers/orders.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return orders.orders.length == 0
        ? Container(
            child: Center(
              child: Text(
                'no Orders',
                style: Theme.of(context).textTheme.title,
              ),
            ),
          )
        : ListView.builder(
            itemCount: orders.listCount,
            itemBuilder: (context, index) {
              return OrderListItem(orderItem: orders.orders[index]);
            });
  }
}
