import 'package:flutter/material.dart';
import 'package:flutter_shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  ProductItem({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
  });

  void selectProduct(BuildContext context) {
    Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: {
      'id': this.id,
      'title': this.title,
      'description': this.description,
      'price': this.price,
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black87,
        ),
        child: GestureDetector(
          child: Image.network(imageUrl, fit: BoxFit.cover),
          onTap: () => selectProduct(context),
        ),
      ),
    );
  }
}
