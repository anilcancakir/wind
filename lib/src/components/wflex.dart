import 'package:flutter/material.dart';

import '../helpers.dart';
import '../parsers/flex_parser.dart';

class WFlex extends StatelessWidget {
  const WFlex({
    super.key,
    this.className = '',
    this.direction,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline, // NO DEFAULT: we don't know what the text's baseline should be
    this.clipBehavior = Clip.none,
    required this.children,
  });

  final dynamic className;
  final Axis? direction;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Clip clipBehavior;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final String parsedClassName = classNameParser(className);

    return FlexParser.applyOverflow(
        context,
        parsedClassName,
        Flex(
          direction:
              direction ?? FlexParser.applyDirection(context, parsedClassName),
          mainAxisAlignment: mainAxisAlignment ??
              FlexParser.applyJustifyContent(context, parsedClassName),
          mainAxisSize: mainAxisSize ??
              FlexParser.applyMainAxisSize(context, parsedClassName),
          crossAxisAlignment: crossAxisAlignment ??
              FlexParser.applyAlignItems(context, parsedClassName),
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline,
          clipBehavior: clipBehavior,
          children:
              FlexParser.applyGapToChildren(context, parsedClassName, children),
        ));
  }
}
