/// Base Value Constant
library;

import 'package:flutter/material.dart';

class Constans {
  static const String apiBaseUrl = 'https://admin.sknet.id/api';
  static const String keyAPI = 'ITlNmjoGY0LUvy';
  static double? deviceHeight;
  static double? deviceWidth;
  
  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    deviceHeight = size.height;
    deviceWidth = size.width;
  }
}
