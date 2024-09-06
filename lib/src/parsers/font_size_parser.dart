import 'package:flutter/material.dart';

import '../theme/wind_theme.dart';
import 'screens_parser.dart';

class FontSizeParser {
  static final RegExp regExp = RegExp(
      r'^(?:[a-zA-Z0-9]+:)?text-(?<size>[a-zA-Z0-9]+)$');

  static double? toFontSize(String className) {
    double? fontSize;

    for (var name in className.split(' ')) {
      final match = regExp.firstMatch(name);
      if (match != null && WindTheme.hasFontSize(match.namedGroup('size')!)) {
        fontSize = WindTheme.getFontSize(match.namedGroup('size')!) *
            WindTheme.getRemFactor();
      }
    }

    return fontSize;
  }

  static double? applyFontSize(BuildContext context, String className) {
    double? fontSize;

    for (var name in className.split(' ')) {
      final match = regExp.firstMatch(name);
      if (match != null && WindTheme.hasFontSize(match.namedGroup('size')!) &&
          ScreensParser.canApply(context, name)) {
        fontSize = WindTheme.getFontSize(match.namedGroup('size')!) *
            WindTheme.getRemFactor();
      }
    }

    return fontSize;
  }

  static double? toFontSizeHeight(String className) {
    double? height;

    for (var name in className.split(' ')) {
      final match = regExp.firstMatch(name);
      if (match != null &&
          WindTheme.hasFontSizeHeight(match.namedGroup('size')!)) {
        height = WindTheme.getFontSizeHeight(match.namedGroup('size')!);
      }
    }

    return height;
  }

  static double? applyFontSizeHeight(BuildContext context, String className) {
    double? height;

    for (var name in className.split(' ')) {
      final match = regExp.firstMatch(name);
      if (match != null &&
          WindTheme.hasFontSizeHeight(match.namedGroup('size')!) &&
          ScreensParser.canApply(context, name)) {
        height = WindTheme.getFontSizeHeight(match.namedGroup('size')!);
      }
    }

    return height;
  }
}