import 'package:flutter/material.dart';

class CustomDismissible extends StatefulWidget {
  static const routeName = '/custom-dismissible';

  @override
  _CustomDismissibleState createState() => _CustomDismissibleState();
}

class _CustomDismissibleState extends State<CustomDismissible> {
  final items = List<String>.generate(20, (item) => "Item ${item + 1}");
  DismissDirection dismissDirection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            child: ListTile(
              title: Text(
                '${items[index]}',
              ),
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
