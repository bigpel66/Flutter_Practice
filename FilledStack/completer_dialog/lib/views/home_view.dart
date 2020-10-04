import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:completer_dialog/providers/providers.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (BuildContext context, HomeViewModel model, Widget child) {
          return Scaffold(
            body: Center(
              child: FlatButton(
                child: Text(model.state),
                onPressed: model.doSomething,
              ),
            ),
          );
        },
      ),
    );
  }
}
