import 'package:flutter/widgets.dart';
import '../constants/amore_constants.dart';

enum ScreenSize { mobile, tablet, desktop }

class Responsive {
  Responsive._();

  static ScreenSize of(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return forWidth(w);
  }

  static ScreenSize forWidth(double w) {
    if (w < AmoreBreakpoints.mobile) return ScreenSize.mobile;
    if (w < AmoreBreakpoints.tablet) return ScreenSize.tablet;
    return ScreenSize.desktop;
  }

  static bool isMobile(BuildContext context) =>
      of(context) == ScreenSize.mobile;
  static bool isTablet(BuildContext context) =>
      of(context) == ScreenSize.tablet;
  static bool isDesktop(BuildContext context) =>
      of(context) == ScreenSize.desktop;

  /// Returns a value that varies by screen size.
  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    switch (of(context)) {
      case ScreenSize.desktop:
        return desktop ?? tablet ?? mobile;
      case ScreenSize.tablet:
        return tablet ?? mobile;
      case ScreenSize.mobile:
        return mobile;
    }
  }

  static double pagePadding(BuildContext context) =>
      value(context, mobile: 20.0, tablet: 48.0, desktop: 100.0);

  static double maxWidth(BuildContext context) => 1200;
}
