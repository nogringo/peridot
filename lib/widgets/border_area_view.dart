import 'package:flutter/material.dart';

class BorderAreaView extends StatelessWidget {
  final Widget child;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;

  const BorderAreaView({
    super.key,
    required this.child,
    this.borderColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    // A Material, not a decorated Container, so child ink (tile hover) is clipped to the corners.
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor ?? Theme.of(context).dividerColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(padding: padding ?? EdgeInsets.all(8), child: child),
    );
  }
}
