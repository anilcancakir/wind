
import 'package:flutter/material.dart';
import 'package:wind/src/parsers/flex_parser.dart';

import '../helpers.dart';
import '../parsers/alignment_parser.dart';
import '../parsers/background_color_parser.dart';
import '../parsers/border_parser.dart';
import '../parsers/margin_parser.dart';
import '../parsers/padding_parser.dart';
import '../parsers/size_parser.dart';

class WContainer extends StatelessWidget {
  const WContainer({
    super.key,
    this.className = '',
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
  });

  final dynamic className;
  final Widget? child;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Clip clipBehavior;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final String parsedClassName = classNameParser(className);

    return FlexParser.applyFlexible(context, parsedClassName, Container(
      alignment: alignment ?? AlignmentParser.applyAlignment(context, parsedClassName),
      padding: padding ?? PaddingParser.applyGeometry(context, parsedClassName),
      decoration: decoration ?? BoxDecoration(
        color: color ?? BackgroundColorParser.applyColor(context, parsedClassName),
        borderRadius: BorderParser.applyBorderRadiusGeometry(context, parsedClassName),
        border: BorderParser.applyBoxBorder(context, parsedClassName),
      ),
      foregroundDecoration: foregroundDecoration,
      width: width ?? SizeParser.applyWidth(context, parsedClassName),
      height: height ?? SizeParser.applyHeight(context, parsedClassName),
      constraints: constraints ?? SizeParser.applyBoxConstraints(context, parsedClassName),
      margin: margin ?? MarginParser.applyGeometry(context, parsedClassName),
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      child: child,
    ));
  }
}