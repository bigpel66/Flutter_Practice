import 'package:flutter/material.dart';
import './cart-bloc-inherited.dart';

class CartProvider extends InheritedWidget {
  final CartBloc cartBloc;

  CartProvider({Key key, CartBloc cartBloc, Widget child})
      : cartBloc = cartBloc ?? CartBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CartBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<CartProvider>())
        .cartBloc;
  }
}
