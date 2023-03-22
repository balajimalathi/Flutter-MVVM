import 'package:buildbase/core/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';
import 'package:unicons/unicons.dart';

import '../core/responsive/responsiver.dart';
import 'menu_controller.dart';

/// Created by Balaji Malathi on 22-03-2023 at 21:56.
class MainContentView extends StatelessWidget {
  const MainContentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: context.read<MenuAppController>().scaffoldKey,
        appBar: AppBar(
          title: const Text('Main Content'),
          leading:
              Responsiver.isDesktop(context) || Responsiver.isTablet(context)
                  ? const SizedBox.shrink()
                  : null,
          leadingWidth:
              Responsiver.isDesktop(context) || Responsiver.isTablet(context)
                  ? 0.0
                  : 56.0,
        ),
        //context.read<MenuAppController>().controlMenu,
        drawer: const SideDrawer(),
        body: Row(
          children: [
            Responsiver.isDesktop(context) || Responsiver.isTablet(context)
                ? const Expanded(flex: 2, child: SideDrawer())
                : const SizedBox.shrink(),
            const Expanded(
              flex: 10,
              child: SingleChildScrollView(
                child: Responsive(
                  children: [
                    Div(
                        divison: Division(
                          colXS: 12,
                          colS: 12,
                          colM: 12,
                          colL: 12,
                          colXL: 12,
                        ),
                        child: Placeholder())
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Get the context value and change the selected tile
    // context.read()
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              SvgPicture.asset(
                "assets/svg/logo.svg",
                height: 56,
              ),
              Text("Minia",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700))
                  .pb(8),
            ],
          ),
          ListTile(
            title: const Text("Menu 1"),
            onTap: () {},
            trailing: const Icon(UniconsLine.angle_right),
          ),
          ListTile(
            title: const Text("Menu 2"),
            onTap: () {},
            trailing: const Icon(UniconsLine.angle_right),
          ),
          ExpansionTile(
            title: const Text("Expandable Menu 3"),
            children: [
              ListTile(
                title: const Text("Menu 3.1"),
                onTap: () {},
                trailing: const Icon(UniconsLine.angle_right),
              ),
              ListTile(
                title: const Text("Menu 3.2"),
                onTap: () {},
                trailing: const Icon(UniconsLine.angle_right),
              ),
            ],
          ),
          ListTile(
            title: const Text("Menu 4"),
            onTap: () {},
            trailing: const Icon(UniconsLine.angle_right),
          )
        ],
      ),
    );
  }
}
