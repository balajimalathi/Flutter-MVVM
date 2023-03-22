import 'package:flutter/cupertino.dart';

import 'i_navigation_service.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();

  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

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
        ?.pushNamedAndRemoveUntil(path, (Route<dynamic> route) => false, arguments: data);
  }

  @override
  Future<void>? popToPageReplaced(String path, {Object? data}) async {
    await navigatorKey.currentState?.popAndPushNamed(path, arguments: data);
  }
}
