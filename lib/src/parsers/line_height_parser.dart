import 'package:flutter/material.dart';

import '../theme/wind_theme.dart';
import 'screens_parser.dart';

class LineHeightParser {
  static final RegExp regExp =
      RegExp(r'^(?:[a-zA-Z0-9]+:)?leading-(?<size>[a-zA-Z0-9]+)$');

  static double? toLineHeight(String className) {
    double? height;

    for (var name in className.split(' ')) {
      final match = regExp.firstMatch(name);
      if (match != null && WindTheme.hasLineHeight(match.namedGroup('size')!)) {
        height = WindTheme.getLineHeight(match.namedGroup('size')!);
      }
    }

    return height;
  }

  static double? applyLineHeight(BuildContext context, String className) {
    double? height;

    for (var name in className.split(' ')) {
      final match = regExp.firstMatch(name);
      if (match != null &&
          WindTheme.hasLineHeight(match.namedGroup('size')!) &&
          ScreensParser.canApply(context, name)) {
        height = WindTheme.getLineHeight(match.namedGroup('size')!);
      }
    }

    return height;
  }
}
