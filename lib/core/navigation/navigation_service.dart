import 'package:flutter/cupertino.dart';

import 'INavigationService.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();

  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<dynamic> navigateToPage(String path, {Object? data}) async {
    await navigatorKey.currentState?.pushNamed(path, arguments: data);
  }

  @override
  Future<dynamic> navigateToPageReplaced(String path, {Object? data}) async {
    await navigatorKey.currentState
        ?.pushReplacementNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear(String path, {Object? data}) async {
    await navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }

  @override
  Future<void>? popToPageReplaced(String path, {Object? data}) async {
    await navigatorKey.currentState?.popAndPushNamed(path, arguments: data);
  }
}
