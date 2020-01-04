import 'package:flutter/material.dart';

class ProductDetailItem extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;

  ProductDetailItem({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          SizedBox(height: 10),
          Text(
            '\$$price',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              description,
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
