import 'package:flutter/material.dart';
import '../widgets/product_form_field.dart';

class AddProductScreen extends StatelessWidget {
  static const routeName = '/add-product';

  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: ProductFormField(),
    );
  }
}
