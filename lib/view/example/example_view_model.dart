/// Created by Balaji Malathi on 22-03-2023 at 15:28.
import 'package:flutter/material.dart';

import '../../core/base/base_model.dart';
import 'example.service.dart';

class ExampleViewModel extends BaseModel with BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  //region Variable Initialization
  late ExampleService _service;

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
}