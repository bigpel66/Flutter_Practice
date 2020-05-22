import 'dart:math';
import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatefulWidget {
  static const routeName = '/custom-animated-container';
  
  @override
  _CustomAnimatedContainerState createState() =>
      _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState extends State<CustomAnimatedContainer> {
  double _width = 50;
  double _height = 50;
  double _circular = 25.0;
  Color _color = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          duration: Duration(seconds: 1),
          curve: Curves.easeIn,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(_circular),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _circular = random.nextInt(100).toDouble();
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
