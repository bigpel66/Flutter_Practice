import 'package:flutter/material.dart';
import 'package:flutter_shop_app/widgets/product_form_field.dart';
import '../widgets/product_form_field.dart';

class EditProductScreen extends StatelessWidget {
  static const routeName = '/edit-product';

  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: ProductFormField(),
    );
  }
}
