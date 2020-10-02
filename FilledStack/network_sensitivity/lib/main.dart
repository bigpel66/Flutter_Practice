import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:network_sensitivity/ui/views/views.dart';
import 'package:network_sensitivity/services/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (BuildContext context) => ConnectivityService().status,
      child: MaterialApp(
        title: 'network sensitivity to ui',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
        ),
        home: HomeView(),
      ),
    );
  }
}
