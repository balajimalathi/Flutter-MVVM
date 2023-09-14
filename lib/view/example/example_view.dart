import 'package:buildbase/core/extensions/context_extension.dart';
import 'package:buildbase/core/extensions/widget_extension.dart';
import 'package:buildbase/core/navigation/router_service.dart';
import 'package:buildbase/product/navigation/route_constant.dart';
import 'package:buildbase/view/example/example_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_ui/responsive_ui.dart';

import '../../core/base/base_view.dart';
import '../../product/components/field_builder_widget.dart';
import '../../product/components/column_spacing_widget.dart';

/// Created by Balaji Malathi on 22-03-2023 at 15:27.
class ExampleScreen extends StatelessWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ExampleViewModel>(
      onModelReady: (ExampleViewModel model) {
        model.setContext(context);
        model.init();
      },
      builder: (context, model, child) => Scaffold(
        body: SingleChildScrollView(
          child: Responsive(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 10,
            children: [
              Div(
                divison: const Division(
                  colXS: 12,
                  colS: 12,
                  colM: 6,
                  colL: 4,
                  colXL: 4,
                ),
                child: FormBuilder(
                  key: model.formKey,
                  child: ColumnSpacing(
                    spacing: 16,
                    padding: context.paddingLowHorizontal,
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/logo.svg",
                            height: 56,
                          ),
                          Text("Welcome Back !",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.w700))
                              .pb(8),
                          const Text("Sign in to continue to Minia."),
                        ],
                      ),
                      FieldBuilder(
                          label: "Username",
                          child: FormBuilderTextField(
                            name: "username",
                          )),
                      FieldBuilder(
                          label: "Password",
                          child: FormBuilderTextField(
                            name: "password",
                          )),
                      ElevatedButton(
                          onPressed: () {
                            if (model.formKey.currentState?.saveAndValidate() ??
                                false) {
                              RouterService.instance.pushTo(
                                  RouterConstant.mainContentView);
                              debugPrint(
                                  model.formKey.currentState?.value.toString());
                            } else {
                              debugPrint(
                                  model.formKey.currentState?.value.toString());
                              debugPrint('validation failed');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.all(18)),
                          child: const Text("DATA"))
                    ],
                  ),
                ),
              ),
              Div(
                divison: const Division(
                  colXS: 12,
                  colS: 12,
                  colM: 6,
                  colL: 8,
                  colXL: 8,
                ),
                child: Container(
                  height: context.height,
                  color: Colors.lightGreenAccent,
                  child: PageView(
                    children: const [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("data"),
                          Row(
                            children: [
                              CircleAvatar(),
                              Column(
                                children: [
                                  Text("data"),
                                  Text("data"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
