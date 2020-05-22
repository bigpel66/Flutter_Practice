import 'package:flutter/material.dart';
import './src/custom-animated-container.dart';
import './src/custom-animated-opacity.dart';
import './src/custom-drawer.dart';
import './src/custom-snack-bar.dart';
import './src/custom-orientation-builder.dart';
import './src/custom-tab-controller.dart';
import './src/custom-form-validation.dart';
import './src/custom-dismissible.dart';
import './src/custom-page-view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter cook book',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.teal,
        accentColor: Colors.lightBlue,
      ),
      home: Home(),
      routes: {
        CustomAnimatedContainer.routeName: (context) =>
            CustomAnimatedContainer(),
        CustomAnimatedOpacity.routeName: (context) => CustomAnimatedOpacity(),
        CustomDrawer.routeName: (context) => CustomDrawer(),
        CustomSnackBar.routeName: (context) => CustomSnackBar(),
        CustomOrientationBuilder.routeName: (context) =>
            CustomOrientationBuilder(),
        CustomTabController.routeName: (context) => CustomTabController(),
        CustomFormValidation.routeName: (context) => CustomFormValidation(),
        CustomDismissible.routeName: (context) => CustomDismissible(),
        CustomPageView.routeName: (context) => CustomPageView(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cook Book')),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Custom Animated Container'),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(CustomAnimatedContainer.routeName);
              },
            ),
            RaisedButton(
              child: Text('Custom Animated Opacity'),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CustomAnimatedOpacity.routeName,
                );
              },
            ),
            RaisedButton(
              child: Text('Custom Drawer'),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CustomDrawer.routeName,
                );
              },
            ),
            RaisedButton(
              child: Text('Custom SnackBar'),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CustomSnackBar.routeName,
                );
              },
            ),
            RaisedButton(
              child: Text('Custom Orientation Builder'),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CustomOrientationBuilder.routeName,
                );
              },
            ),
            RaisedButton(
              child: Text('Custom Tab Controller'),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CustomTabController.routeName,
                );
              },
            ),
            RaisedButton(
              child: Text('Custom Form Validation'),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CustomFormValidation.routeName,
                );
              },
            ),
            RaisedButton(
              child: Text('Custom Dismissible'),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CustomDismissible.routeName,
                );
              },
            ),
            RaisedButton(
              child: Text('Custom Page View'),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CustomPageView.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
