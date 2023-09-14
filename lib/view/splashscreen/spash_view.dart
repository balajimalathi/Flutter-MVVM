import 'package:buildbase/core/navigation/router_service.dart';
import 'package:flutter/material.dart';

import '../../product/navigation/route_constant.dart';

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
          onPressed: () =>
              RouterService.instance.pushTo(RouterConstant.example),
          child: const Text('Splash screen')),
    ));
  }
}
