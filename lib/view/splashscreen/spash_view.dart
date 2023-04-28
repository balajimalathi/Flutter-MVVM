import 'package:buildbase/core/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../product/navigation/navigation_constants.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        onPressed: ()=> NavigationService.instance.pushTo(NavigationConstants.example),
          child: const Text('Splash screen')),
    ));
  }
}
