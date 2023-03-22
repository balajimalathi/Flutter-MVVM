import 'dart:async';

import 'package:buildbase/core/constants/enums/connectivity.dart';
import 'package:buildbase/core/constants/enums/viewstate.dart';
import 'package:buildbase/core/cache/local_manager.dart';
import 'package:buildbase/core/navigation/navigation_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  NetworkStatus _connectivityStatus = NetworkStatus.offline;

  NetworkStatus get network => _connectivityStatus;

  StreamController<NetworkStatus> connectionStatusController =
      StreamController<NetworkStatus>();

  BaseModel() {
    // Subscribe to the connectivity Chanaged Steam
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather more info if you need t
      connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  // Convert from the third part enum to our own enum
  NetworkStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        setNetwork(NetworkStatus.mobile);
        return NetworkStatus.mobile;
      case ConnectivityResult.wifi:
        setNetwork(NetworkStatus.wifi);
        return NetworkStatus.wifi;
      case ConnectivityResult.none:
        setNetwork(NetworkStatus.offline);
        return NetworkStatus.offline;
      default:
        setNetwork(NetworkStatus.offline);
        return NetworkStatus.offline;
    }
  }

  void setNetwork(NetworkStatus conStatus) {
    _connectivityStatus = conStatus;
    notifyListeners();
  }

/// Triggers when app opens
  Future<void> refreshNetwork() async {
    var result = await Connectivity().checkConnectivity();

    switch (result) {
      case ConnectivityResult.mobile:
        setNetwork(NetworkStatus.mobile);
        break;
      case ConnectivityResult.wifi:
        setNetwork(NetworkStatus.wifi);
        break;
      case ConnectivityResult.none:
        setNetwork(NetworkStatus.offline);
        break;
      default:
        setNetwork(NetworkStatus.offline);
    }
  }
}

abstract class BaseViewModel {
  late BuildContext context;

  LocalManager localManager = LocalManager.instance;
  NavigationService navigationService = NavigationService.instance;

  void setContext(BuildContext context);
  void init() {}
}




// class InternetModel extends ChangeNotifier {
//   NetworkStatus _connectivityStatus = NetworkStatus.Offline;

//   NetworkStatus get connectivityStatus => _connectivityStatus;

//   StreamController<NetworkStatus> connectionStatusController =
//       StreamController<NetworkStatus>();

//   InternetModel() {
//     // Subscribe to the connectivity Chanaged Steam
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       // Use Connectivity() here to gather more info if you need t
//       connectionStatusController.add(_getStatusFromResult(result));
//     });
//   }

//   // Convert from the third part enum to our own enum
//   NetworkStatus _getStatusFromResult(ConnectivityResult result) {
//     switch (result) {
//       case ConnectivityResult.mobile:
//         setNetwork(NetworkStatus.Mobile);
//         return NetworkStatus.Mobile;
//       case ConnectivityResult.wifi:
//         setNetwork(NetworkStatus.WiFi);
//         return NetworkStatus.WiFi;
//       case ConnectivityResult.none:
//         setNetwork(NetworkStatus.Offline);
//         return NetworkStatus.Offline;
//       default:
//         setNetwork(NetworkStatus.Offline);
//         return NetworkStatus.Offline;
//     }
//   }

//   void setNetwork(NetworkStatus conStatus) {
//     _connectivityStatus = conStatus;
//     notifyListeners();
//   }
// }
