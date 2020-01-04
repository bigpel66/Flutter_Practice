import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/product_detail_item.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final productId = routeArgs['id'];
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: ProductDetailItem(
        id: loadedProduct.id,
        title: loadedProduct.title,
        description: loadedProduct.description,
        imageUrl: loadedProduct.imageUrl,
        price: loadedProduct.price,
      ),
    );
  }
}
