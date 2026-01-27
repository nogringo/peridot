import 'package:flutter/material.dart';

double responsiveHorizontalPadding(double width, {double maxWidth = 600}) {
  return ((width - maxWidth) / 2).clamp(0.0, double.infinity);
}

class ResponsiveListView extends StatelessWidget {
  final List<Widget>? children;
  final int? itemCount;
  final Widget? Function(BuildContext, int)? itemBuilder;
  final EdgeInsetsGeometry? padding;
  final double maxWidth;

  const ResponsiveListView({
    super.key,
    required List<Widget> this.children,
    this.padding,
    this.maxWidth = 600,
  }) : itemCount = null,
       itemBuilder = null;

  const ResponsiveListView.builder({
    super.key,
    required int this.itemCount,
    required Widget? Function(BuildContext, int) this.itemBuilder,
    this.padding,
    this.maxWidth = 600,
  }) : children = null;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontalPadding = responsiveHorizontalPadding(
          constraints.maxWidth,
          maxWidth: maxWidth,
        );

        final basePadding = padding ?? EdgeInsets.zero;
        final responsivePadding = EdgeInsets.symmetric(
          horizontal: horizontalPadding + (basePadding.horizontal / 2),
          vertical: basePadding.vertical / 2,
        );

        if (children != null) {
          return ListView(padding: responsivePadding, children: children!);
        }

        return ListView.builder(
          padding: responsivePadding,
          itemCount: itemCount,
          itemBuilder: itemBuilder!,
        );
      },
    );
  }
}
