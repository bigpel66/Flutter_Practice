import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './order_list_item.dart';
import '../providers/orders.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  bool _isLoading = false;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Orders>(
        context,
      ).fetchAndSetOrders();
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : orders.orders.length == 0
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
