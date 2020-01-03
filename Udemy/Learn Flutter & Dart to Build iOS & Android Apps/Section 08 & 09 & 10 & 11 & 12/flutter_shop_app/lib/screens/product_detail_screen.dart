import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final productId = routeArgs['id'];
    final productTitle = routeArgs['title'];
    final productDescription = routeArgs['description'];
    final productPrice = routeArgs['price'];

    // print(productId);
    // print(productTitle);
    // print(productDescription);
    // print(productPrice);

    return Scaffold(
      appBar: AppBar(title: Text(productTitle)),
      body: Text(''),
    );
  }
}
