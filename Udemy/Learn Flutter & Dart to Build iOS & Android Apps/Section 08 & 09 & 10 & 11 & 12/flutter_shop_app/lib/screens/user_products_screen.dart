import 'package:flutter/material.dart';
import 'package:flutter_shop_app/widgets/app_drawer.dart';
import '../widgets/user_products_list.dart';
import '../widgets/app_drawer.dart';
import '../screens/add_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  void showRegisterProductScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                showRegisterProductScreen(context);
              }),
        ],
      ),
      drawer: AppDrawer(),
      body: UserProductList(),
    );
  }
}
