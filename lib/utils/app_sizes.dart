import 'package:flutter/material.dart';
import 'package:get/get.dart';

Orientation currentOrientation = MediaQuery.of(Get.context!).orientation;

var size = currentOrientation == Orientation.portrait ? Get.height : Get.width;

class DeviceSizes {
  static final double size12 = 1.5 * size / 100;
  static final double size13 = 1.6 * size / 100;
  static final double size14 = 1.8 * size / 100;
  static final double size15 = 1.9 * size / 100;
  static final double size16 = 2.0 * size / 100;
  static final double size18 = 2.3 * size / 100;
  static final double size20 = 2.5 * size / 100;
  static final double size22 = 2.8 * size / 100;
  static final double size24 = 3.1 * size / 100;
  static final double size26 = 3.4 * size / 100;
  static final double size28 = 3.7 * size / 100;
  static final double size30 = 4.0 * size / 100;

  static double custom(percentage) {
    return percentage * size / 100;
  }
}
