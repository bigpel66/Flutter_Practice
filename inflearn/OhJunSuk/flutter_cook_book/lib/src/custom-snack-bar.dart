import 'package:flutter/material.dart';

class CustomSnackBar extends StatefulWidget {
  static const routeName = '/custom-snack-bar';

  @override
  _CustomSnackBarState createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: RaisedButton(
            onPressed: () {
              final snackBar = SnackBar(
                content: Text('This is SnackBar'),
                action: SnackBarAction(
                  label: 'Cancel',
                  onPressed: () {},
                ),
                duration: Duration(seconds: 2),
              );

              Scaffold.of(context).showSnackBar(snackBar);
            },
            child: Text('Show SnackBar'),
          ),
        ),
      ),
    );
  }
}
