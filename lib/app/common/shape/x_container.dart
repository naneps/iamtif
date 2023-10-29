import 'package:flutter/widgets.dart';

class XContainer extends AnimatedContainer {
  XContainer({
    Key? key,
    required Widget child,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
    double? width,
    double? height,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    BoxConstraints constraints = const BoxConstraints(),
    Matrix4? transform,
    AlignmentGeometry? alignment,
    Clip? clipBehavior,
    double? opacity,
    double? rotation,
    double? radius,
    Widget? Function(BuildContext context, Widget? child)? builder,
  }) : super(
          key: key,
          child: child,
          duration: duration,
          curve: curve,
          width: width,
          height: height,
          margin: margin,
          constraints: constraints,
          padding: padding ?? const EdgeInsets.all(10),
          decoration: decoration ??
              BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(radius ?? 5),
              ),
          foregroundDecoration: foregroundDecoration,
          transform: transform,
          alignment: alignment,
          clipBehavior: clipBehavior ?? Clip.none,
          onEnd: () {},
          transformAlignment: Alignment.center,
        );
}
