import 'package:flutter/material.dart';

import 'screens_parser.dart';

class TextDecorationParser {
  static final Map<String, TextDecoration> decorations = {
    'no-underline': TextDecoration.none,
    'underline': TextDecoration.underline,
    'overline': TextDecoration.overline,
    'line-through': TextDecoration.lineThrough,
  };

  static TextDecoration? toDecoration(String className) {
    TextDecoration? decoration;
    for (var name in className.split(' ')) {
      if (decorations.containsKey(name)) {
        decoration = decorations[name];
      }
    }
    return decoration;
  }

  static TextDecoration? applyDecoration(BuildContext context, String className) {
    TextDecoration? decoration;
    for (var name in className.split(' ')) {
      if (decorations.containsKey(name) && ScreensParser.canApply(context, name)) {
        decoration = decorations[name];
      }
    }
    return decoration;
  }
}