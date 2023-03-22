import 'package:buildbase/core/extensions/context_extension.dart';
import 'package:buildbase/view/example/example_view_model.dart';
import 'package:flutter/material.dart';

import '../../core/base/base_view.dart';

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
            appBar: AppBar(title: const Text('Example')),
            body: Container(
              padding: context.paddingLowAll,
              child: Column(
                children: [
                  Text(model.sampleString),
                  TextFormField(
                    onChanged: (s){
                      model.sampleString = s;
                    },
                  )
                ],
              ),
            ),
          ),
    );
  }
}
