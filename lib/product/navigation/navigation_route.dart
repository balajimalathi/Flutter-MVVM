import 'package:buildbase/core/navigation/navigation_service.dart';
import 'package:buildbase/view/main_content.dart';
import 'package:buildbase/view/splashscreen/spash_view.dart';
import 'package:flutter/material.dart';

import '../../view/example/example_view.dart';
import 'navigation_constants.dart';

/// Navigation Route which generate the routes
/// All the routes have to be declared in this file.
///
/// [Navigator] can also be used in the framework to enable the flexibility,
/// when you don't want to use the [NavigationRoute]
///
/// [NavigationRoute.instance] should be called followed by the [NavigationService] to
/// navigate
///
class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.root:
        return navigate(const SplashScreen(), args);
      case NavigationConstants.example:
        return navigate(const ExampleScreen(), args);
      case NavigationConstants.mainContentView:
        return navigate(const MainContentView(), args);
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  // Function is used to create the navigation
  ///  * [Widget] is the scaffold
  ///  * [RouteSettings] is the Settings where it contains the route name and arguments
  ///
  MaterialPageRoute navigate(Widget widget, RouteSettings route) {
    return MaterialPageRoute(
      settings: route,
      builder: (context) => widget,
    );
  }
}

/// [NotFoundNavigationWidget] is the widget which will be used to show when the
/// route is not defined in the NavigationRoute
///
class NotFoundNavigationWidget extends StatelessWidget {
  const NotFoundNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Error Route"));
  }
}
