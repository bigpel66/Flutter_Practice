import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 75.0,
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white60,
        indicatorColor: Colors.transparent,
        tabs: <Widget>[
          Tab(
            icon: Icon(Icons.home, size: 18.0),
            child: Text(
              'Home',
              style: TextStyle(fontSize: 9.0),
            ),
          ),
          Tab(
            icon: Icon(Icons.search, size: 18.0),
            child: Text(
              'Search',
              style: TextStyle(fontSize: 9.0),
            ),
          ),
          Tab(
            icon: Icon(Icons.save_alt, size: 18.0),
            child: Text(
              'Saved Contents',
              style: TextStyle(fontSize: 9.0),
            ),
          ),
          Tab(
            icon: Icon(Icons.list, size: 18.0),
            child: Text(
              'More',
              style: TextStyle(fontSize: 9.0),
            ),
          ),
        ],
      ),
    );
  }
}
