import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../src/cart-page.dart';
import '../bloc/cart-bloc.dart';
import '../model/item.dart';

class CatalogPage extends StatefulWidget {
  static const routeName = '/catalog-page';

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  List<Item> items = itemList;

  Widget _buildListItem(Item item, List state, CartBloc bloc) {
    final isChecked = state.contains(item);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          '${item.title}',
          style: TextStyle(fontSize: 32.0),
        ),
        subtitle: Text('${item.price}'),
        trailing: IconButton(
          icon: isChecked
              ? Icon(Icons.check, color: Colors.red)
              : Icon(Icons.check),
          onPressed: () {
            setState(() {
              if (isChecked) {
                bloc.add(
                    CartEvent(eventType: CartEventType.remove, item: item));
              } else {
                bloc.add(CartEvent(eventType: CartEventType.add, item: item));
              }
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CartPage.routeName);
            },
            icon: Icon(Icons.archive),
          ),
        ],
      ),
      body: BlocBuilder(
        bloc: _cartBloc,
        builder: (context, state) {
          return Center(
            child: ListView(
              children: items
                  .map((item) => _buildListItem(item, state, _cartBloc))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
