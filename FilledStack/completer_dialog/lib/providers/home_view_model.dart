import 'package:completer_dialog/models/alert_response.dart';
import 'package:flutter/material.dart';
import 'package:completer_dialog/locator.dart';
import 'package:completer_dialog/services/services.dart';

class HomeViewModel extends ChangeNotifier {
  final DialogService _dialogService = locator<DialogService>();
  String state = 'initialized';

  Future doSomething() async {
    AlertResponse _alertResponse = await _dialogService.showDialog(
      title: 'Dialog Manager',
      description:
          'The ViewModel calls showDialog method in the DialogService.\n\nThe UI of a dialog that would like to build is on the DialogManager.\n\nThus, DialogManger is registered on the DialogService which controls the Business Logic.',
    );

    if (_alertResponse.confirmed) {
      state = 'confirmed';
    } else {
      state = 'not confirmed';
    }

    notifyListeners();
  }
}
