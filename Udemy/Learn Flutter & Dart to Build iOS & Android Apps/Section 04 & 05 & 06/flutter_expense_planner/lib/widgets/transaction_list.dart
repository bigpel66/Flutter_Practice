import 'package:flutter/material.dart';
import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> currentTransactionList;
  final Function deleteHandler;

  TransactionList(
      {@required this.currentTransactionList, @required this.deleteHandler});

  @override
  Widget build(BuildContext context) {
    return currentTransactionList.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(currentTransaction: currentTransactionList[index], deleteHandler: deleteHandler);
            },
            itemCount: currentTransactionList.length,
          );
  }
}