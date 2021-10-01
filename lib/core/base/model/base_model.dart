import 'package:buildbase/core/constants/enums/viewstate.dart';
import 'package:buildbase/core/init/cache/locale_manager.dart';
import 'package:buildbase/core/navigation/navigation_service.dart';
import 'package:flutter/cupertino.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}

abstract class BaseViewModel {
  late BuildContext context;

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);
  void init() {}
}
