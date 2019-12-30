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
        // : ListView.builder(
        //     itemBuilder: (ctx, index) {
        //       return TransactionItem(
        //           key: ValueKey(currentTransactionList[index].id),
        //           currentTransaction: currentTransactionList[index],
        //           deleteHandler: deleteHandler);
        //     },
        //     itemCount: currentTransactionList.length,
        //   );
        : ListView(
            children: currentTransactionList.map((tx) {
            return TransactionItem(
              key: ValueKey(tx.id),
              currentTransaction: tx,
              deleteHandler: deleteHandler,
            );
          }).toList());
  }
}
