import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Counter()),
      ],
      child: MaterialApp(
        title: 'provider counter',
        home: CustomCounter(),
      ),
    );
  }
}

class CustomCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<Counter>(builder: (context, counter, _) {
              return Text(
                '${counter.count}',
                style: Theme.of(context).textTheme.display1,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: counter.increment,
      ),
    );
  }
}
