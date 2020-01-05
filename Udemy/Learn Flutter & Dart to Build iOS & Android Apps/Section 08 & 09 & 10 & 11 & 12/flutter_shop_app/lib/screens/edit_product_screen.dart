import 'package:flutter/material.dart';
import '../widgets/edit_product.dart';

class EditProductScreen extends StatelessWidget {
  static const routeName = '/edit-product';

  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: EditProduct(),
    );
  }
}
