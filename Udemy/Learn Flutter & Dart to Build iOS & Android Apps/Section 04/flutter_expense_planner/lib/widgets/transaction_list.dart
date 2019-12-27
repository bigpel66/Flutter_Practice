import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> currentTransactionList;
  final Function deleteHandler;

  TransactionList(
      {@required this.currentTransactionList, @required this.deleteHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: currentTransactionList.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child:
                              Text('\$${currentTransactionList[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      currentTransactionList[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd()
                          .format(currentTransactionList[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () =>
                          deleteHandler(currentTransactionList[index].id),
                    ),
                  ),
                );
              },
              itemCount: currentTransactionList.length,
            ),
    );
  }
}
