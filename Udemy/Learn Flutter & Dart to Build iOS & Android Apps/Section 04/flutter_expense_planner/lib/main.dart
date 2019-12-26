import 'package:flutter/material.dart';
import './widgets/user_transaction.dart';

void main() => runApp(
      MaterialApp(
        title: 'Practice with Udemy',
        home: MyHomePage(),
      ),
    );

class MyHomePage extends StatelessWidget {
  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(context: context, builder: (ctx) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text(
                  'CHART!',
                  textAlign: TextAlign.center,
                ),
                elevation: 5,
              ),
            ),
            UserTransactions(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
