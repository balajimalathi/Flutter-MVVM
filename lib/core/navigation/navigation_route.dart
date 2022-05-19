import 'package:buildbase/core/constants/navigation/navigation_constants.dart';
import 'package:buildbase/view/example/examples.dart';
import 'package:buildbase/view/splashscreen/spash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.ROOT:
        return normalNavigate(SplashScreen());

      case NavigationConstants.EXAMPLE:
        return normalNavigate(Examples());

      // case NavigationConstants.LOGIN_VIEW:
      //   return normalNavigate(LoginView());

      // case NavigationConstants.ONBOARD:
      //   return normalNavigate(OnBoardView());
      //
      // case NavigationConstants.LOGIN_VIEW:
      //   return normalNavigate(LoginView());
      //
      // case NavigationConstants.SETTINGS_VIEW:
      //   return normalNavigate(SettingsView());
      //
      // case NavigationConstants.CHANGE_PASSWORD_VIEW:
      //   return normalNavigate(ChangePasswordView());
      //
      // case NavigationConstants.PROFILE_VIEW:
      //   return normalNavigate(ProfileView());
      //
      // case NavigationConstants.ADD_PLANNED_TOUR_FINDING:
      //   return navigateWithData(AddPlannedTourFindingView(), args.arguments);
      //
      // case NavigationConstants.PLANNED_TOUR_LIST_VIEW:
      //   return normalNavigate(PlannedTourListView());
      //
      // case NavigationConstants.PLANNED_TOUR_DETAIL_VIEW:
      //   return navigateWithData(PlannedTourDetailView(), args.arguments);
      //
      // case NavigationConstants.ADD_UNPLANNED_TOUR_VIEW:
      //   return normalNavigate(AddUnPlannedTourView());
      //
      // case NavigationConstants.ADD_UNPLANNED_TOUR_VIEW2:
      //   return normalNavigate(AddUnPlannedTourView2());
      //
      // case NavigationConstants.ADD_UNPLANNED_TOUR_FINDING:
      //   return navigateWithData(AddUnPlannedTourFindingView(), args.arguments);
      //
      // case NavigationConstants.UNPLANNED_TOUR_LIST_VIEW:
      //   return normalNavigate(UnPlannedTourListView());
      //
      // case NavigationConstants.UNPLANNED_TOUR_DETAIL_VIEW:
      //   return navigateWithData(UnPlannedTourDetailView(), args.arguments);

      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
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
    return Center(child: Text("Error Route"));
  }
}
