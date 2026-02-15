import 'package:flutter/material.dart';

import 'dimensions.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({Key? key, required this.mobile, this.tablet, required this.desktop})
    : super(key: key);

  // This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) => AppDimension(context).width < 600;

  static bool isBigMobile(BuildContext context) =>
      AppDimension(context).width > 600 && AppDimension(context).width < 800;

  static bool isTablet(BuildContext context) =>
      AppDimension(context).width < 1100 && AppDimension(context).width >= 800;

  static bool isDesktop(BuildContext context) => AppDimension(context).width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size size = AppDimension(context).size;
    // If our width is cards than 1100 then we consider it a desktop
    if (size.width >= 1100) {
      return desktop;
    }
    // If width it less then 1100 and cards then 850 we consider it as tablet
    else if (size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
