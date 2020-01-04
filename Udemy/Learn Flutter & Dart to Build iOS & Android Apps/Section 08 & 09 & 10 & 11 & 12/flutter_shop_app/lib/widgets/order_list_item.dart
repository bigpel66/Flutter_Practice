import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders.dart';

class OrderListItem extends StatelessWidget {
  final OrderItem orderItem;

  OrderListItem({@required this.orderItem});

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.network(orderItem.products[0].imageUrl),
            title: Column(
              children: <Widget>[
                Text(
                  '${orderItem.products[0].title} with ${orderItem.products.length - 1} ${orderItem.products.length - 1 == 1 ? 'product' : 'products'}',
                ),
                Text('\$${orderItem.amount}')
              ],
            ),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(orderItem.dateTime),
            ),
            trailing:
                IconButton(icon: Icon(Icons.expand_more), onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
