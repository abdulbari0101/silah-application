import 'package:flutter/material.dart';

class TabView {
  final String title;
  final Widget widget;
  final String? tabIcon;
  final bool isEnabled;
  final void Function()? onSelect;

  TabView({
    required this.title,
    required this.widget,
    this.tabIcon,
    this.onSelect,
    this.isEnabled = true,
  });
}
