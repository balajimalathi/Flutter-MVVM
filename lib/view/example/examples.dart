import 'package:after_layout/after_layout.dart';
import 'package:buildbase/core/constants/enums/preferences_keys_enum.dart';
import 'package:buildbase/core/constants/navigation/navigation_constants.dart';
import 'package:buildbase/core/init/cache/locale_manager.dart';
import 'package:buildbase/core/navigation/navigation_service.dart';
import 'package:buildbase/view/example/tab/view/tab_view.dart';
import 'package:flutter/material.dart';

import 'bottom_nav/view/bottom_view.dart';

class Examples extends StatefulWidget {
  const Examples({Key? key}) : super(key: key);

  @override
  State<Examples> createState() => _ExamplesState();
}

class _ExamplesState extends State<Examples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: FlutterLogo(),
            title: Text('Tab'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const TabView())),
          ),
          ListTile(
            leading: FlutterLogo(),
            title: Text('Bottom Navigation'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => const BottomView())),
          )
        ],
      ),
    );
  }
}
