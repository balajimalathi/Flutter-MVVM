import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SizeConfig {
  static late double _screenWidth;
  static late double _screenHeight;

  static double? screenWidth_;
  static double? screenHeight_;

  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static double? textMultiplier;
  static double? imageSizeMultiplier;
  static late double heightMultiplier;
  static late bool isPortrait;
  static late bool isTab;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenHeight = constraints.maxHeight;
      _screenWidth = constraints.maxWidth;

      screenHeight_ = constraints.maxHeight;
      screenWidth_ = constraints.maxWidth;

      print("Portrait");
      isPortrait = true;

      //isTab finder
      if (_screenWidth > 600) {
        isTab = true;
      } else {
        isTab = false;
      }

    } else {
      _screenHeight = constraints.maxWidth;
      _screenWidth = constraints.maxHeight;

      screenHeight_ = constraints.maxHeight;
      screenWidth_ = constraints.maxWidth;

      print("Landscape");
      isPortrait = false;

      // isTab finder
      if (_screenWidth > 600) {
        isTab = true;
      } else {
        isTab = false;
      }
    }

    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    heightMultiplier = _blockSizeVertical;
  }
}
