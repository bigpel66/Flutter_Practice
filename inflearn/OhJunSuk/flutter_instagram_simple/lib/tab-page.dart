import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './home-page.dart';
import './search-page.dart';
import './account-page.dart';

class TabPage extends StatefulWidget {
  static const routeName = '/tab-page';

  final FirebaseUser userInfo;

  TabPage({this.userInfo});

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  List _pagesOnBottomNavigation;

  void _changeBottomNavigationPage(int pageNumber) {
    setState(() {
      _selectedIndex = pageNumber;
    });
  }

  @override
  void initState() {
    super.initState();
    _pagesOnBottomNavigation = [
      HomePage(userInfo: widget.userInfo),
      SearchPage(),
      AccountPage(userInfo: widget.userInfo),
    ];
  }

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
        fixedColor: Colors.black,
      ),
    );
  }
}
