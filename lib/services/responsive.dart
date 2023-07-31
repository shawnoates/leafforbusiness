import 'package:flutter/material.dart';
import 'package:leaf_for_business/configs/configs.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  // screen sizes
  static bool isMobile() => AppMedia.width < AppBreakpoints.sm;

  static bool isTablet() =>
      AppMedia.width < AppBreakpoints.xmd &&
      AppMedia.width >= AppBreakpoints.sm;

  static bool isDesktop() => AppMedia.width >= AppBreakpoints.lg;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= AppBreakpoints.lg) {
          return desktop;
        } else if (constraints.maxWidth >= AppBreakpoints.md) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
