import 'dart:async';

import 'package:buildbase/core/base/base_view.dart';
import 'package:buildbase/core/constants/enums/connectivity.dart';
import 'package:buildbase/core/constants/enums/viewstate.dart';
import 'package:buildbase/core/cache/local_manager.dart';
import 'package:buildbase/core/navigation/navigation_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

/// [BaseModel] extends with ViewModel in the [BaseView]
///
class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  /// [ViewState] is handling the State of the Page
  ///
  /// [ViewState.idle] is the default state of the page
  ///
  /// Before calling the the API or async function in order to display content on the
  /// page, use setState to define the state of the page, example,
  /// ```dart
  /// setState(ViewState.busy);
  /// await Future();
  /// setState(ViewState.idle);
  /// ```
  ///
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  NetworkStatus _connectivityStatus = NetworkStatus.offline;

  NetworkStatus get network => _connectivityStatus;

  StreamController<NetworkStatus> connectionStatusController =
      StreamController<NetworkStatus>();

  BaseModel() {
    // Subscribe to the connectivity Changed Steam
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

/// [BaseViewModel] is a mixin class to reuse the variables and functions on ViewModel to extend the
/// [BuildContext], [LocalManager] and [NavigationService], so we do not need to
/// initialize to use, it will be auto initialized when they are invoked in the ViewModel
abstract class BaseViewModel {

  /// [BuildContext] is used to identify the context of the page, it will be utilized in the ViewModel
  /// to handle the [Navigator] or [BottomSheet] or [Dialog]
  ///
  late BuildContext context;

  LocalManager localManager = LocalManager.instance;

  NavigationService navigationService = NavigationService.instance;

  /// Function used to initialize the [BuildContext] for the ViewModel
  ///
  void setContext(BuildContext context);

  /// [init] will be called first when the ViewModel is declared
  ///
  void init() {}
}
