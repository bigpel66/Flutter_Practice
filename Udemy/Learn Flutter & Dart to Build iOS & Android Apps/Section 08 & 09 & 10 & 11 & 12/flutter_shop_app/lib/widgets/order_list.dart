import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './order_list_item.dart';
import '../providers/orders.dart';

class OrderList extends StatelessWidget {
// class OrderList extends StatefulWidget {
//   @override
//   _OrderListState createState() => _OrderListState();
// }

// class _OrderListState extends State<OrderList> {
  // bool _isLoading = false;

  // @override
  // void initState() {
  //   Future.delayed(Duration.zero).then((_) async {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     await Provider.of<Orders>(
  //       context,
  //     ).fetchAndSetOrders();
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final orders = Provider.of<Orders>(context);

    return FutureBuilder(
      future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
      builder: (context, snapshotData) {
        if (snapshotData.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshotData.error != null) {
            return Center(child: Text('Something went wrong'));
          } else {
            return RefreshIndicator(
              onRefresh: () => Provider.of<Orders>(context, listen: false)
                  .fetchAndSetOrders(),
              child: Consumer<Orders>(
                builder: (context, orders, child) {
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
                            return OrderListItem(
                                orderItem: orders.orders[index]);
                          });
                },
              ),
            );
          }
        }
      },
    );
  }
}
