
import 'package:flutter/material.dart';

class OrientationProvider extends ChangeNotifier{

  bool isPortrait = true;
  bool isTab = false;

  void onChange(bool isPortrait, bool isTab) {
    this.isTab = isTab;
    this.isPortrait = isPortrait;

    print(this.isTab.toString()+ "  " +this.isPortrait.toString());
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void notifyListeners() {
  }
}