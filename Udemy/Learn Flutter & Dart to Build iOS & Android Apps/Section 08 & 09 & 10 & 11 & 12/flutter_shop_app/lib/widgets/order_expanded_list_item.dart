import 'package:flutter/material.dart';
import '../providers/cart.dart';

class OrderExpandedListItem extends StatelessWidget {
  final CartItem cartItem;

  OrderExpandedListItem({@required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          cartItem.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '${cartItem.quantity} x \$${cartItem.price}',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
