import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartListItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          leading: Container(
            width: 50,
            height: 50,
            child: imageUrl == null
                ? Icon(Icons.monetization_on)
                : Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          title: Text(title),
          subtitle: Text('\$$price x $quantity'),
          trailing: Text('Total: \$${price * quantity}'),
        ),
      ),
    );
  }
}
