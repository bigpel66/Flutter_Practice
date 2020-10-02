import 'package:flutter/material.dart';
import 'package:provider_practice/ui/views/views.dart';

class TabContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginView(),
            HomeView(),
          ],
        ),
      ),
    );
  }
}
