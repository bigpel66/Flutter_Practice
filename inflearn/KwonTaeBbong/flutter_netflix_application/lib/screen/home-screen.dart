import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TopBar();
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/bbongflix_logo.png',
            fit: BoxFit.contain,
            height: 25.0,
          ),
          Container(
            padding: const EdgeInsets.only(right: 1.0),
            child: Text(
              'TV Programs',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 1.0),
            child: Text(
              'Movies',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 1.0),
            child: Text(
              'Dibs',
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
