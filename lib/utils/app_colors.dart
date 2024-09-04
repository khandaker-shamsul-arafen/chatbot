import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryBackground = Color.fromRGBO(26, 29, 37, 1);
 // static const Color primaryBackground = Color(0xFF282B31);
 // static const Color primaryBackground = Color(0xFF171C25);
  static const Color primaryWidget = Color(0xFF252B39);
 // static const Color primaryWidget = Color(0xFF404248);

  static const Color primaryText = Color(0xFFFFFFFF);

  static const Color secondaryBackground = Color(0xFFE1DCDD);
  //static const Color secondaryWidget = Color(0xFFEEEEEE);
  static const Color secondaryWidget = Color(0xFFEEEDEB);
  static const Color secondaryText =Color(0xFF060B21);

  static const Color bottomNavigationColor = Color(0xFF171C25);

  static const LinearGradient fixtureColor = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF22284C),
        Color(0xFF060B21),
        Colors.transparent,
        Colors.transparent,
        Colors.transparent,
        Color(0xFF060B21),
        Color(0xFF1E2445),
      ]);


  static const Color primary = Color(0xFF11CD90);
//  static const Color primary = Color(0xFF9860E4);
  static MaterialColor primaryMaterialColor =
  getMaterialColorFromColor(AppColors.primary);
  //static const Color secondary = Color(0xFFFFFFFF);

  static MaterialColor getMaterialColorFromColor(Color color) {
    Map<int, Color> colorShades = {
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color, value: 0.1),
      500: color, //Primary value
      600: getShade(color, value: 0.1, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
        (darker ? (hsl.lightness - value) : (hsl.lightness + value))
            .clamp(0.0, 1.0));

    return hslDark.toColor();
  }


}
