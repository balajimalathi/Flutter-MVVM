import 'package:after_layout/after_layout.dart';
import 'package:buildbase/core/constants/enums/preferences_keys_enum.dart';
import 'package:buildbase/core/constants/navigation/navigation_constants.dart';
import 'package:buildbase/core/init/cache/locale_manager.dart';
import 'package:buildbase/core/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin{

  void user() async {

    bool email = LocaleManager.instance.getBoolValue(PreferencesKeys.IS_FIRST_APP);

    if (email == true) {
      NavigationService.instance.navigateToPageClear(NavigationConstants.LANDING_VIEW);
    } else {
      NavigationService.instance.navigateToPageClear(NavigationConstants.LOGIN_VIEW);
    }
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("data")));
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    user();
  }
}

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  _LandingViewState createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.green,));
  }
}
