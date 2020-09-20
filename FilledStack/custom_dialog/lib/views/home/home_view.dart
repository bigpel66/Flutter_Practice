import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:custom_dialog/views/dialog/dialog_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DialogViewModel>.reactive(
      builder: (
        BuildContext context,
        DialogViewModel dialogViewModel,
        Widget child,
      ) {
        return Scaffold(
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  child: Text('Show Basic Dialog'),
                  onPressed: () => dialogViewModel.showBasicDialog(),
                ),
                Text(
                  'Basic result: ${dialogViewModel.basicResult}',
                ),
                SizedBox(height: 25),
                OutlineButton(
                  child: Text('Show Confirmation Dialog'),
                  onPressed: () => dialogViewModel.showConfirmationDialog(),
                ),
                Text(
                  'Confirmation result: ${dialogViewModel.confirmationResult}',
                ),
                SizedBox(height: 25),
                OutlineButton(
                  child: Text('Show Basic Custom Dialog'),
                  onPressed: () => dialogViewModel.showBasicCustomDialog(),
                ),
                Text(
                  'Custom Dialog result: ${dialogViewModel.basicCustomResult}',
                ),
                SizedBox(height: 25),
                OutlineButton(
                  child: Text('Show Form Custom Dialog'),
                  onPressed: () => dialogViewModel.showFormCustomDialog(),
                ),
                Text(
                  'Custom Dialog result: ${dialogViewModel.formCustomResult}',
                ),
                Text(
                  'Custom Dialog string: ${dialogViewModel.formCustomString}',
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => DialogViewModel(),
    );
  }
}
