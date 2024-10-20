import 'package:flutter/material.dart';

import '../theme/wind_theme.dart';
import 'screens_parser.dart';

class ShadowParser {
  static final RegExp _shadowRegExp = RegExp(r'^(?:[a-zA-Z0-9]+:)?shadow-?(?<size>[a-zA-Z0-9]*)$');

  static double? applyElevation(BuildContext context, String className) {
    double? elevation;

    for (var name in className.split(' ')) {
      final match = _shadowRegExp.firstMatch(name);
      if (match != null && ScreensParser.canApply(context, name)) {
        final size = match.namedGroup('size')!;
        if (WindTheme.hasShadowSize(size)) {
          elevation = WindTheme.getShadowSize(size);
        }
      }
    }

    return elevation;
  }
}