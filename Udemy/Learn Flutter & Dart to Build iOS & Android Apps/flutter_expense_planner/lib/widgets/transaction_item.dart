import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    @required Key key,
    @required this.currentTransaction,
    @required this.deleteHandler,
  }) : super(key: key);

  final Transaction currentTransaction;
  final Function deleteHandler;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${widget.currentTransaction.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.currentTransaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.currentTransaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                icon: const Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                label: const Text('Delete'),
                onPressed: () =>
                    widget.deleteHandler(widget.currentTransaction.id),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () =>
                    widget.deleteHandler(widget.currentTransaction.id),
              ),
      ),
    );
  }
}
