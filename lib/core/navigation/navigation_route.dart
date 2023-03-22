import 'package:buildbase/core/constants/navigation/navigation_constants.dart';
import 'package:buildbase/view/splashscreen/spash_view.dart';
import 'package:flutter/material.dart';

import '../../view/example/example_view.dart';

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
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute navigate(Widget widget, RouteSettings route) {
    return MaterialPageRoute(
      settings: route,
      builder: (context) => widget,
    );
  }

  MaterialPageRoute navigateWithData(Widget widget, dynamic data) {
    return MaterialPageRoute(
        builder: (context) => widget, settings: RouteSettings(arguments: data));
  }
}

class NotFoundNavigationWidget extends StatelessWidget {
  const NotFoundNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Error Route"));
  }
}
