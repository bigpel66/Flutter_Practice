import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_products_list.dart';
import '../screens/edit_product_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  void showRegisterProductScreen(BuildContext context) {
    Navigator.of(context).pushNamed(EditProductScreen.routeName);
  }

  Future<void> refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false)
        .fetchAndSetProducts(true);
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
      body: FutureBuilder(
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: () => refreshProducts(context),
                  child: UserProductList(),
                );
        },
        future: refreshProducts(context),
      ),
    );
  }
}
