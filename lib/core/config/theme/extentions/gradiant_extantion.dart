import 'package:flutter/material.dart';

extension GradientExtensions on LinearGradient {
  LinearGradient get withVerticalGradient =>
      LinearGradient(colors: colors, begin: Alignment.topCenter, end: Alignment.bottomCenter);

  LinearGradient get withHorizontalGradient =>
      LinearGradient(colors: colors, begin: Alignment.centerLeft, end: Alignment.centerRight);

  LinearGradient get withDiagonalGradient =>
      LinearGradient(colors: colors, begin: Alignment.topLeft, end: Alignment.bottomRight);
}
