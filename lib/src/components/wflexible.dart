import 'package:flutter/material.dart';

import '../helpers.dart';
import '../parsers/flex_parser.dart';

class WFlexible extends StatelessWidget {
  const WFlexible({
    super.key,
    this.className,
    this.flex,
    this.fit,
    required this.child,
  });

  final dynamic className;
  final int? flex;
  final FlexFit? fit;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final parsedClassName = classNameParser(className);

    return Flexible(
      flex: flex ?? FlexParser.applyFlex(context, parsedClassName) ?? 1,
      fit: fit ??
          FlexParser.applyFlexFit(context, parsedClassName) ??
          FlexFit.loose,
      child: child,
    );
  }
}
