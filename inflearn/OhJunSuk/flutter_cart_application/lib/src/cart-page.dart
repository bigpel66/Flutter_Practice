import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart-bloc.dart';
import '../model/item.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/cart-page';

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext contxet) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartBloc, List<Item>>(
          bloc: BlocProvider.of<CartBloc>(context),
          builder: (context, state) {
            var sum = 0;

            if (state.length > 0) {
              sum = state.map((item) => item.price).reduce((x, y) => x + y);
            }

            return Center(
              child: Text('Sum : $sum'),
            );
          }),
    );
  }
}
