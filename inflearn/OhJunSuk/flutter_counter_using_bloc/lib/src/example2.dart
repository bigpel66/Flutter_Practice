import 'package:flutter/material.dart';
import './bloc/counter-bloc.dart';

final counterBloc = CounterBloc();

class Example2 extends StatelessWidget {
  static const routeName = '/example/2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: StreamBuilder<Object>(
            stream: counterBloc.counter,
            // initialData: 0,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('You pressed counter ${snapshot.data} times');
              } else {
                return Text('Error Occured');
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterBloc.addCounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
