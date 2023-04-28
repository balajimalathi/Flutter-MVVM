import 'package:buildbase/core/extensions/string_extension.dart';
import 'package:buildbase/core/extensions/widget_extension.dart';
import 'package:buildbase/product/components/spacing_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/responsive_ui.dart';
import 'package:unicons/unicons.dart';

import '../core/responsive/responsiver.dart';
import 'menu_controller.dart';

/// Created by Balaji Malathi on 22-03-2023 at 21:56.
class MainContent2View extends StatelessWidget {
  const MainContent2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: context.read<MenuAppController>().scaffoldKey,
        //context.read<MenuAppController>().controlMenu,
        // drawer: const SideDrawer(),
        body: Row(
          children: [
            Expanded(
              flex: 2,
                child: SideDrawer()),
            Expanded(
              flex: 10,
                child: Column(
              children: [
                AppBar(),
                Expanded(child:
                ColumnSpacing(
                  children: [
                    FormBuilderTextField(name: "name"),
                    FormBuilderTextField(name: "name"),
                    FormBuilderTextField(name: "name"),
                    FormBuilderTextField(name: "name"),
                    FormBuilderTextField(name: "name"),
                    FormBuilderTextField(name: "name"),
                    FormBuilderTextField(name: "name"),
                  ],
                ))
              ],
            ))
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
            title: Text("Menu 1", style: Theme.of(context).textTheme.bodyMedium,),
            onTap: () {},
            leading: const Icon(UniconsLine.umbrella),
            trailing: const Icon(UniconsLine.angle_right),
          ),
          ListTile(
            title: Text("Menu 2", style: Theme.of(context).textTheme.bodyMedium,),
            onTap: () {},
                leading: const Icon(UniconsLine.calculator),
            trailing: const Icon(UniconsLine.angle_right),
          ),
          ExpansionTile(
            title: Text("Expandable Menu 3", style: Theme.of(context).textTheme.bodyMedium,),
            children: [
              ListTile(
                title: Text("Menu 3.1", style: Theme.of(context).textTheme.bodyMedium,),
                onTap: () {},
                leading: const Icon(UniconsLine.icons),
                trailing: const Icon(UniconsLine.angle_right),
              ),
              ListTile(
                title: Text("Menu 3.2", style: Theme.of(context).textTheme.bodyMedium,),
                onTap: () {},
                leading: const Icon(UniconsLine.object_group),
                trailing: const Icon(UniconsLine.angle_right),
              ),
            ],
          ),
          ListTile(
            title: Text("Menu 4", style: Theme.of(context).textTheme.bodyMedium,),
            onTap: () {},
                leading: const Icon(UniconsLine.head_side),
            trailing: const Icon(UniconsLine.angle_right),
          )
        ],
      ),
    );
  }
}
