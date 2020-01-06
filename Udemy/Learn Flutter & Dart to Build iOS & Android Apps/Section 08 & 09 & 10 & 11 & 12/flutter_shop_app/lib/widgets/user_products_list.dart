import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './user_products_list_item.dart';
import '../providers/products.dart';

class UserProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: products.items.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              UserProductsListItem(
                id: products.items[index].id,
                title: products.items[index].title,
                imageUrl: products.items[index].imageUrl,
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
