import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;

  void _changeBottomNavigationPage(int pageNumber) {
    setState(() {
      _selectedIndex = pageNumber;
    });
  }

  List _pagesOnBottomNavigation = [
    Text('1'),
    Text('2'),
    Text('3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pagesOnBottomNavigation[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Account'),
          ),
        ],
        onTap: _changeBottomNavigationPage,
      ),
    );
  }
}
