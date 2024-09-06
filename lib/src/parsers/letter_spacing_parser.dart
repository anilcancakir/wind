import 'package:flutter/material.dart';

import '../theme/wind_theme.dart';
import 'screens_parser.dart';

class LetterSpacingParser {
  static final RegExp regExp = RegExp(r'^(?:[a-zA-Z0-9]+:)?tracking-(?<size>[a-zA-Z0-9]+)$');

  static double? toLetterSpacing(String className) {
    double? letterSpacing;

    for (var name in className.split(' ')) {
      final match = regExp.firstMatch(name);
      if (match != null && WindTheme.hasLetterSpacing(match.namedGroup('size')!)) {
        letterSpacing = WindTheme.getLetterSpacing(match.namedGroup('size')!) * WindTheme.getPixelFactor();
      }
    }

    return letterSpacing;
  }

  static double? applyLetterSpacing(BuildContext context, String className) {
    double? letterSpacing;

    for (var name in className.split(' ')) {
      final match = regExp.firstMatch(name);
      if (match != null && WindTheme.hasLetterSpacing(match.namedGroup('size')!) && ScreensParser.canApply(context, name)) {
        letterSpacing = WindTheme.getLetterSpacing(match.namedGroup('size')!) * WindTheme.getPixelFactor();
      }
    }

    return letterSpacing;
  }
}