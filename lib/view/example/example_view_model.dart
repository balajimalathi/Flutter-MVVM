/// Created by Balaji Malathi on 22-03-2023 at 15:28.
import 'package:buildbase/core/helpers/future_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../core/base/base_model.dart';
import 'example.impl.dart';

class ExampleViewModel extends BaseModel with BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  //region Variable Initialization
  late ExampleRepository _repo;

  //endregion
  @override
  void init() {
    _repo = ExampleRepositoryImpl();
  }

  String _sampleString = "";

  String get sampleString => _sampleString;

  set sampleString(String value) {
    _sampleString = value;
    notifyListeners();
  }

  Future datav() async {
    await _repo.moveForward(1).fold((left) => null, (right) => null);
  }
}
