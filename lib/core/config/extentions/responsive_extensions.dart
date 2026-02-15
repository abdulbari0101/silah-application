import 'package:flutter/material.dart';

extension ResponsiveExtensions on BuildContext {
  static const double _figmaWidth = 393;
  static const double _figmaHeight = 852;

  double widthPx(double figmaPx) {
    return MediaQuery.of(this).size.width * (figmaPx / _figmaWidth);
  }

  double heightPx(double figmaPx) {
    return MediaQuery.of(this).size.height * (figmaPx / _figmaHeight);
  }

  double fontPx(double figmaPx) {
    return widthPx(figmaPx);
  }

  double radiusPx(double figmaPx) {
    return widthPx(figmaPx);
  }
}
