import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:custom_dialog/views/home/home_view.dart';
import 'package:custom_dialog/services/locator.dart';
import 'package:custom_dialog/ui/setup_dialog_ui.dart';

void main() {
  setupLocator();
  setupDialogUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeView(),
      navigatorKey: locator<DialogService>().navigatorKey,
    );
  }
}
