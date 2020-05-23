import 'package:flutter/material.dart';
import '../model/item.dart';
import '../bloc/cart-bloc-inherited.dart';
import '../bloc/cart-bloc-inherited-provider.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/cart-bloc-package.dart';

class CartPage extends StatefulWidget {
  static const routeName = '/cart-page';

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext contxet) {
    CartBloc cartBloc = CartProvider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: StreamBuilder(
          stream: cartBloc.cartList,
          builder: (context, snapshot) {
            var sum = 0;

            if (snapshot.hasData) {
              sum = snapshot.data
                  .map((item) => item.price)
                  .reduce((x, y) => x + y);
            }

            return Center(
              child: Text('Sum : $sum'),
            );
            ;
          },
        )

        // BlocBuilder<CartBloc, List<Item>>(
        //     bloc: BlocProvider.of<CartBloc>(context),
        //     builder: (context, state) {
        //       var sum = 0;

        //       if (state.length > 0) {
        //         sum = state.map((item) => item.price).reduce((x, y) => x + y);
        //       }

        //       return Center(
        //         child: Text('Sum : $sum'),
        //       );
        //     }),
        );
  }
}
