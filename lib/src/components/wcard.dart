import 'package:flutter/material.dart';

import '../helpers.dart';
import '../parsers/background_color_parser.dart';
import '../parsers/border_parser.dart';
import '../parsers/flex_parser.dart';
import '../parsers/margin_parser.dart';
import '../parsers/padding_parser.dart';
import '../parsers/shadow_parser.dart';
import '../parsers/size_parser.dart';

class WCard extends StatelessWidget {
  const WCard({
    super.key,
    this.className = '',
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground = true,
    this.margin,
    this.clipBehavior,
    this.child,
    this.semanticContainer = true,
  });

  final dynamic className;
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool borderOnForeground;
  final Clip? clipBehavior;
  final EdgeInsetsGeometry? margin;
  final bool semanticContainer;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final String parsedClassName = classNameParser(className);

    Widget childComponent = Card(
      color:
          color ?? BackgroundColorParser.applyColor(context, parsedClassName),
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation:
          elevation ?? ShadowParser.applyElevation(context, parsedClassName),
      shape: shape ?? BorderParser.applyBorder(context, parsedClassName),
      borderOnForeground: borderOnForeground,
      margin: margin ?? MarginParser.applyGeometry(context, parsedClassName),
      clipBehavior: clipBehavior,
      semanticContainer: semanticContainer,
      child: child != null
          ? PaddingParser.apply(context, parsedClassName, child!)
          : null,
    );

    if (SizeParser.hasAnyValid(parsedClassName)) {
      childComponent = ConstrainedBox(
        constraints: SizeParser.applyBoxConstraints(context, parsedClassName),
        child: childComponent,
      );
    }

    return FlexParser.applyFlexible(context, parsedClassName, childComponent);
  }
}
