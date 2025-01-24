/// Base Value Constant
library;

import 'package:flutter/material.dart';

class Constans {
  static const String apiBaseUrl = 'https://admin.sknet.id/api';
  static const String keyAPI = 'ITlNmjoGY0LUvy';
  static late double deviceHeight;
  static late double deviceWidth;
  static double? blockHeight;
  static double? blockWidth;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    deviceHeight = size.height;
    deviceWidth = size.width;
    blockHeight = deviceHeight / 100;
    blockWidth = deviceWidth / 100;
  }
}
