import 'package:flutter/material.dart';

typedef WHoverCallback = Widget Function(bool hovering);

class WInkWell extends StatefulWidget {
  const WInkWell({
    super.key,
    this.child,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onSecondaryTap,
    this.onSecondaryTapUp,
    this.onSecondaryTapDown,
    this.onSecondaryTapCancel,
    this.onHighlightChanged,
    this.onHover,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.overlayColor,
    this.splashColor,
    this.splashFactory,
    this.radius,
    this.borderRadius,
    this.customBorder,
    this.enableFeedback,
    this.excludeFromSemantics,
    this.focusNode,
    this.canRequestFocus,
    this.onFocusChange,
    this.autofocus,
    this.statesController,
    this.hoverDuration,
  });

  final dynamic child;
  final GestureTapCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureTapCallback? onTapCancel;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final GestureTapCallback? onSecondaryTap;
  final GestureTapDownCallback? onSecondaryTapDown;
  final GestureTapUpCallback? onSecondaryTapUp;
  final GestureTapCallback? onSecondaryTapCancel;
  final ValueChanged<bool>? onHighlightChanged;
  final ValueChanged<bool>? onHover;
  final MouseCursor? mouseCursor;
  final double? radius;
  final BorderRadius? borderRadius;
  final ShapeBorder? customBorder;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final bool? enableFeedback;
  final bool? excludeFromSemantics;
  final ValueChanged<bool>? onFocusChange;
  final bool? autofocus;
  final FocusNode? focusNode;
  final bool? canRequestFocus;
  final WidgetStatesController? statesController;
  final Duration? hoverDuration;

  @override
  State<WInkWell> createState() => _WInkWellState();
}

class _WInkWellState extends State<WInkWell> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onDoubleTap: widget.onDoubleTap,
      onLongPress: widget.onLongPress,
      onTapDown: widget.onTapDown,
      onTapUp: widget.onTapUp,
      onTapCancel: widget.onTapCancel,
      onSecondaryTap: widget.onSecondaryTap,
      onSecondaryTapDown: widget.onSecondaryTapDown,
      onSecondaryTapUp: widget.onSecondaryTapUp,
      onSecondaryTapCancel: widget.onSecondaryTapCancel,
      onHighlightChanged: widget.onHighlightChanged,
      onHover: (bool hovering) {
        if (widget.onHover != null) {
          widget.onHover!(hovering);
        }

        setState(() {
          isHovering = hovering;
        });
      },
      mouseCursor: widget.mouseCursor,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      highlightColor: widget.highlightColor,
      overlayColor: widget.overlayColor,
      splashColor: widget.splashColor,
      splashFactory: widget.splashFactory,
      radius: widget.radius,
      borderRadius: widget.borderRadius,
      customBorder: widget.customBorder,
      enableFeedback: widget.enableFeedback,
      excludeFromSemantics: widget.excludeFromSemantics ?? false,
      focusNode: widget.focusNode,
      canRequestFocus: widget.canRequestFocus ?? true,
      onFocusChange: widget.onFocusChange,
      autofocus: widget.autofocus ?? false,
      statesController: widget.statesController,
      hoverDuration: widget.hoverDuration,
      child: widget.child is WHoverCallback
          ? (widget.child as WHoverCallback)(isHovering)
          : widget.child,
    );
  }
}
