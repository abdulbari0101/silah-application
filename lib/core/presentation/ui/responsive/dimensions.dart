import 'package:flutter/material.dart';

//usually used for dimentions
class AppDimension {
  BuildContext context;

  AppDimension(this.context);

  Size get size => MediaQuery.sizeOf(context);
  double get height => MediaQuery.sizeOf(context).height;
  double get width => MediaQuery.sizeOf(context).width;
  Orientation get oriantation => MediaQuery.orientationOf(context);
}
