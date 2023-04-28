/// Created by Balaji Malathi on 22-03-2023 at 15:28.
import 'package:buildbase/core/constants/enums/viewstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../core/base/base_model.dart';
import 'example.service.dart';

class ExampleViewModel extends BaseModel with BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  //region Variable Initialization
  late ExampleService _service;
  final formKey = GlobalKey<FormBuilderState>();
  //endregion
  @override
  void init() {
    _service = ExampleService();
  }

  String _sampleString = "";

  String get sampleString => _sampleString;

  set sampleString(String value) {
    _sampleString = value;
    notifyListeners();
  }

  Future datav () async {
    setState(ViewState.idle);
  }
}
