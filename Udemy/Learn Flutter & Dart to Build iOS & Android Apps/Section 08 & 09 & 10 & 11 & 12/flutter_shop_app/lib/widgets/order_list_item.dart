import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/widgets/order_expanded_list_item.dart';
import 'package:intl/intl.dart';
import '../providers/orders.dart';
import '../providers/cart.dart';

class OrderListItem extends StatefulWidget {
  final OrderItem orderItem;

  OrderListItem({@required this.orderItem});

  @override
  _OrderListItemState createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Image.network(widget.orderItem.products[0].imageUrl),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${widget.orderItem.products[0].title} with ${widget.orderItem.products.length - 1} ${widget.orderItem.products.length - 1 == 1 ? 'product' : 'products'}',
                ),
                Text('\$${widget.orderItem.amount}')
              ],
            ),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.orderItem.dateTime),
            ),
            trailing: widget.orderItem.products.length >= 2
                ? IconButton(
                    icon: _isExpanded
                        ? Icon(Icons.expand_less)
                        : Icon(Icons.expand_more),
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  )
                : null,
          ),
          if (_isExpanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: min(widget.orderItem.products.length * 20.0 + 10, 100),
              child: ListView.builder(
                  itemCount: widget.orderItem.products.length,
                  itemBuilder: (context, index) {
                    CartItem singleCartItem = widget.orderItem.products[index];
                    return OrderExpandedListItem(cartItem: singleCartItem);
                  }),
            ),
        ],
      ),
    );
  }
}
