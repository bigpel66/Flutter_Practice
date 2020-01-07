import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './cart_list_item.dart';
import '../screens/orders_screen.dart';
import '../providers/cart.dart';
import '../providers/orders.dart';

class CartList extends StatelessWidget {
  void showOrderList(BuildContext context) {
    Navigator.of(context).pushNamed(
      OrdersScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItem = cart.items.values.toList();
    return Column(
      children: <Widget>[
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Total', style: TextStyle(fontSize: 20)),
                SizedBox(width: 30),
                Chip(
                  label: Text(
                    '\$${cart.totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Theme.of(context).primaryTextTheme.title.color,
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                Spacer(),
                OrderButton(
                  cartItem: cartItem,
                  cart: cart,
                  listHandler: showOrderList,
                ),
              ],
            ),
          ),
          elevation: 4,
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: cart.itemCount,
            itemBuilder: (context, index) {
              return CartListItem(
                id: cartItem[index].id,
                title: cartItem[index].title,
                quantity: cartItem[index].quantity,
                price: cartItem[index].price,
                imageUrl: cartItem[index].imageUrl,
              );
            },
          ),
        ),
      ],
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cartItem,
    @required this.cart,
    @required this.listHandler,
  }) : super(key: key);

  final List<CartItem> cartItem;
  final Cart cart;
  final Function listHandler;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  bool _isLoading = false;

  void _loadingWaiting(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<Orders>(context, listen: false)
        .addOrder(widget.cartItem, widget.cart.totalPrice);
    setState(() {
      _isLoading = false;
    });
    widget.cart.clearCart();
    if (widget.cartItem.length != 0) widget.listHandler(context);
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldOf = Scaffold.of(context);

    return FlatButton(
      child: _isLoading ? CircularProgressIndicator() : Text('ORDER NOW'),
      onPressed: () async {
        widget.cartItem.length == 0
            ? scaffoldOf.showSnackBar(
                SnackBar(
                  content: Text(
                    'Nothing to Order!',
                    textAlign: TextAlign.center,
                  ),
                  duration: Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'Move to Previous Page',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              )
            : _loadingWaiting(context);
      },
      textColor: Theme.of(context).primaryColor,
    );
  }
}
