import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import 'package:flutter_shop_app/screens/product_detail_screen.dart';

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
                onPressed: () => product.toggleFavoriteStatus(),
                color: Theme.of(context).accentColor,
              );
            },
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
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
