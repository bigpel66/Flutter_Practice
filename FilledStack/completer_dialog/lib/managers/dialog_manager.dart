import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:completer_dialog/locator.dart';
import 'package:completer_dialog/models/models.dart';
import 'package:completer_dialog/services/services.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  DialogManager({Key key, this.child}) : super(key: key);

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  void _showDialog(AlertRequest request) {
    Alert(
      context: context,
      title: request.title,
      desc: request.description,
      closeFunction: () {
        _dialogService.dialogComplete(
          AlertResponse(confirmed: false),
        );
        Navigator.of(context).pop();
      },
      style: AlertStyle(descTextAlign: TextAlign.start),
      buttons: [
        DialogButton(
          child: Text(request.buttonTitle),
          onPressed: () {
            _dialogService.dialogComplete(AlertResponse(confirmed: true));
            Navigator.of(context).pop();
          },
        ),
      ],
    ).show();
  }

  @override
  void initState() {
    super.initState();

    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
