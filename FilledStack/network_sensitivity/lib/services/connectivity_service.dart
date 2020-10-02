import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:network_sensitivity/enums/enums.dart';

class ConnectivityService {
  final StreamController<ConnectivityStatus> _statusController =
      StreamController<ConnectivityStatus>();

  Stream<ConnectivityStatus> get status => _statusController.stream;

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _statusController.add(_getStatusFromResult(result));
    });
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}
