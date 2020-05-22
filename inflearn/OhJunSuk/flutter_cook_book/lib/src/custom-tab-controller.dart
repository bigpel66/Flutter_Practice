import 'package:flutter/material.dart';

class CustomTabController extends StatefulWidget {
  static const routeName = '/custom-tab-controller';

  @override
  _CustomTabControllerState createState() => _CustomTabControllerState();
}

class _CustomTabControllerState extends State<CustomTabController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: Text('Tab Controller'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.access_alarm)),
                Text('2nd'),
                Tab(
                  icon: Icon(Icons.accessible),
                  text: '3rd',
                ),
              ],
            )),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.alarm),
            Center(child: Text('2nd')),
            Center(child: Text('3rd')),
          ],
        ),
      ),
    );
  }
}
