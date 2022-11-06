import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? screenSizeHorizontal;
  static double? screenSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    screenSizeHorizontal = screenWidth! / 100;
    screenSizeVertical = screenHeight! / 100;
  }
}
