import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';
import '../providers/auth.dart';

class ProductItem extends StatelessWidget {
  void selectProduct(BuildContext context, String id) {
    Navigator.of(context).pushNamed(
      ProductDetailScreen.routeName,
      arguments: {'id': id},
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (context, product, child) {
              return IconButton(
                icon: Icon(
                  product.isFavorited ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () => product.toggleFavoriteStatus(
                  authData.token,
                  authData.userId,
                ),
                color: Theme.of(context).accentColor,
              );
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(
                product.id,
                product.title,
                product.price,
                product.imageUrl,
              );
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Item added to the Cart',
                    textAlign: TextAlign.center,
                  ),
                  duration: Duration(seconds: 5),
                  action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        cart.removeLatestItem(product.id);
                      }),
                ),
              );
            },
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black87,
        ),
        child: GestureDetector(
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
          onTap: () => selectProduct(context, product.id),
        ),
      ),
    );
  }
}
