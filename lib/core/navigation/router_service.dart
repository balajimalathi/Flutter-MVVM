import 'package:flutter/cupertino.dart';

import 'router_interface.dart';

/// [RouterService] ease the navigation in the app, by providing the basic
/// and regularly using methods of navigation
///
/// Example:
///
/// ```dart
/// NavigationService.instance.pushTo(Widget());
/// ```
///
class RouterService implements RouterInterface {
  static final RouterService _instance = RouterService._init();

  static RouterService get instance => _instance;

  RouterService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Future<dynamic> pushTo(String path, {Object? data}) async {
    await navigatorKey.currentState?.pushNamed(path, arguments: data);
  }

  @override
  Future<dynamic> pushAndReplace(String path, {Object? data}) async {
    await navigatorKey.currentState
        ?.pushReplacementNamed(path, arguments: data);
  }

  @override
  Future<void> pushAndClear(String path, {Object? data}) async {
    await navigatorKey.currentState
        ?.pushNamedAndRemoveUntil(path, (Route<dynamic> route) => false, arguments: data);
  }

  @override
  Future<void>? popAndReplace(String path, {Object? data}) async {
    await navigatorKey.currentState?.popAndPushNamed(path, arguments: data);
  }
}
