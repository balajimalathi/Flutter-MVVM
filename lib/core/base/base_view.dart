import 'package:buildbase/core/base/base_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

/// [BaseView] wraps around the [Scaffold], extending the functionalities of the
/// ViewModel
///
/// Every Scaffold will the [StatefulWidget], because the [BaseModel] extends the [ChangeNotifier]
/// which will be refresh the UI whenever we call [notifyListeners] in the ViewModel.
///
/// example,
/// ```dart
/// String title = "Hello";
///
/// void changeTitle() {
///   data = "Hello World!!!";
///   notifyListeners();
/// }
/// ```
/// Now the variable title used in the BaseView scaffold will be
/// refreshed into "Hello World!!!"
///
/// No need to [setState]
///
class BaseView<T extends BaseModel> extends StatefulWidget {

  /// [builder] is where the [Scaffold] or [Widget] will go
  ///
  /// * [BuildContext] is the context of the Widgets extends from the [StatefulWidget]
  /// * [T] is the ViewModel object, use [model] to access the variables
  /// and methods from the ViewModel
  /// * [Widget] can be any widget, mostly use [Scaffold]
  /// if you want you can use big widget to refresh the data
  ///
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  /// [onModelReady] will be called when the ViewModel is initalized and
  /// ready to use,
  /// * [T] will be the ViewModel class
  ///
  /// ViewModel object can be used to invoke functions to be executed at first after the [ViewModel]
  /// is loaded
  final Function(T)? onModelReady;

  const BaseView({super.key, required this.builder, required this.onModelReady});

  @override
  BaseViewState<T> createState() => BaseViewState<T>();
}

class BaseViewState<T extends BaseModel> extends State<BaseView<T>> {

  /// [GetIt] declaration
  ///
  /// Without adding the ViewModel in the Dependency Injection,
  /// we can't able to use the ViewModel object.
  ///
  /// It will throw exception, for not adding it in the [locator]
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady!(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {  
    return ChangeNotifierProvider.value(
      value: model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
