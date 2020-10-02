import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:network_sensitivity/enums/enums.dart';

class NetworkSensitive extends StatelessWidget {
  final Widget child;
  final double opacity;

  NetworkSensitive({this.child, this.opacity = 0.5});

  @override
  Widget build(BuildContext context) {
    ConnectivityStatus connectivityStatus =
        Provider.of<ConnectivityStatus>(context);

    if (connectivityStatus == ConnectivityStatus.WiFi) {
      return child;
    }

    if (connectivityStatus == ConnectivityStatus.Cellular) {
      return Opacity(
        opacity: opacity,
        child: child,
      );
    }
    return Opacity(
      opacity: 0.1,
      child: child,
    );
  }
}
