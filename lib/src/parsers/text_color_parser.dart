import 'package:flutter/material.dart';

import '../theme/wind_theme.dart';
import 'screens_parser.dart';

class TextColorParser {
  static final RegExp regExp = RegExp(
      r'^(?:[a-zA-Z0-9]+:)?text-(?<color>[a-zA-Z0-9]+)-?(?<shade>[0-9]{0,3})$');

  static Color toColor(String className) {
    Color color = Colors.transparent;
    for (var name in className.split(' ')) {
      final match = regExp.firstMatch(name);
      if (match != null && WindTheme.isValidColor(match.namedGroup('color')!)) {
        color = WindTheme.getColor(match.namedGroup('color')!,
            shade: match.namedGroup('shade')!.isNotEmpty
                ? int.parse(match.namedGroup('shade')!)
                : 500);
      }
    }
    return color;
  }

  static Color? applyColor(BuildContext context, String className) {
    Color? color;

    for (var name in className.split(' ')) {
      final match = regExp.firstMatch(name);
      if (match != null &&
          WindTheme.isValidColor(match.namedGroup('color')!) &&
          ScreensParser.canApply(context, name)) {
        color = WindTheme.getColor(match.namedGroup('color')!,
            shade: match.namedGroup('shade')!.isNotEmpty
                ? int.parse(match.namedGroup('shade')!)
                : 500);
      }
    }

    return color;
  }
}
