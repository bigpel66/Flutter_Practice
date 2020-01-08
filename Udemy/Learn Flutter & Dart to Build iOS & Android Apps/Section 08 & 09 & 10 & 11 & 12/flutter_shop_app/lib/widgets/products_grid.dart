import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './product_item.dart';
import '../providers/products.dart';

class ProductsGrid extends StatefulWidget {
  final bool showOnlyFavorites;

  ProductsGrid({@required this.showOnlyFavorites});

  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  bool _isInit = true;
  bool _isLoading = false;
  // @override
  // void initState() {
  // Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  // Future.delayed(Duration.zero).then((_) {
  //   Provider.of<Products>(context).fetchAndSetProducts();
  // });
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _isLoading = true;
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = widget.showOnlyFavorites
        ? productsData.favoritedItems
        : productsData.items;

    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : products.length == 0
            ? Center(child: Text('No Items'))
            : GridView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value: products[index],
                    child: ProductItem(),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              );
  }
}
